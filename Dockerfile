FROM debian:bookworm-slim

# 安装必要依赖（curl、bash等）
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates bash sudo unzip \
    && rm -rf /var/lib/apt/lists/*

# 安装 longport-mcp
RUN curl -sSL https://raw.githubusercontent.com/longportapp/openapi/refs/heads/main/mcp/install | bash

# 确保 PATH 包含 longport-mcp
ENV PATH="/usr/local/bin:${PATH}"

# 设置工作目录
WORKDIR /app

# 镜像元信息
LABEL org.opencontainers.image.title="LongPort MCP"
LABEL org.opencontainers.image.description="LongPort MCP SSE server with configurable readonly mode (enabled by default). Set LONGPORT_APP_KEY, LONGPORT_APP_SECRET, and LONGPORT_ACCESS_TOKEN at runtime."
LABEL org.opencontainers.image.authors="zhiyuc@outlook.com"
LABEL org.opencontainers.image.source="https://github.com/zhiyuc123/docker-longport-mcp"
LABEL org.opencontainers.image.version="1.0.0"

ENV LONGPORT_MCP_READONLY="true"

# 启动脚本：默认启用 readonly 模式
RUN echo '#!/bin/sh' > /entrypoint.sh \
    && echo 'if [ "${LONGPORT_MCP_READONLY}" = "true" ]; then' >> /entrypoint.sh \
    && echo '  set -- "$@" --readonly' >> /entrypoint.sh \
    && echo 'fi' >> /entrypoint.sh \
    && echo 'echo "[ENTRYPOINT] Final command: longport-mcp --http $@"' >> /entrypoint.sh \
    && echo 'exec longport-mcp --http --bind 0.0.0.0:8000 "$@"' >> /entrypoint.sh \
    && chmod +x /entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]
