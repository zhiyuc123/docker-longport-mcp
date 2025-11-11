# 🐳 docker-longport-mcp

[简体中文](./README.md) | English

A Dockerized version of [LongPort MCP](https://github.com/longportapp/openapi/tree/main/mcp), running as a Streamable HTTP Server, suitable for MCP integration in AI development platforms.

---

## 🚀 Quick Start

### Pull the Image
```bash
docker pull zhiyuc123/longport-mcp:latest
```

### Run the Container
```bash
docker run -d -e LONGPORT_APP_KEY=your-app-key -e LONGPORT_APP_SECRET=your-app-secret -e LONGPORT_ACCESS_TOKEN=your-access-token -p 8000:8000 zhiyuc123/longport-mcp:latest
```

✅ Runs in **read-only mode** by default
❌ Trading functionality is disabled by default.

---

## ⚙️ Environment Variables

| Name | Required | Description |
|------|----------|-------------|
| `LONGPORT_APP_KEY` | ✅ | App Key for LongPort OpenAPI application |
| `LONGPORT_APP_SECRET` | ✅ | App Secret for LongPort OpenAPI application |
| `LONGPORT_ACCESS_TOKEN` | ✅ | Access Token for LongPort OpenAPI |
| `LONGPORT_MCP_READONLY` | ❌ | Run in read-only mode, disabling trading functionality. Set this environment variable to false to enable trading |

---


## 🧠 Architecture

Supports the following architectures:
- ✅ `linux/amd64` (x86 servers)
- ✅ `linux/arm64` (Apple Silicon)

---

## 📜 License

Apache License, Version 2.0,([LICENSE](./LICENSE) or http://www.apache.org/licenses/LICENSE-2.0)
