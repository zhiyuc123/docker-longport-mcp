# 🐳 docker-longport-mcp

简体中文 | [English](./README_EN.md)

[LongPort MCP](https://github.com/longportapp/openapi/tree/main/mcp) 的 Docker 化版本，这是一个 [MCP](https://modelcontextprotocol.io/introduction) 服务器实现，为 [LongPort OpenAPI](https://open.longportapp.com) 提供实时股票市场数据，使 AI 能够访问分析和交易功能。此 Docker 版本以 SSE（服务器发送事件）HTTP 服务器方式运行，适用于 AI 开发平台的 MCP 集成。

---

## ✨ 功能特性

- **交易** - 创建、修改、取消订单，查询今日/历史订单和交易详情
- **行情** - 实时行情、获取历史行情
- **持仓** - 实时查询账户资产、持仓和资金

---

## 🚀 快速开始

### 拉取镜像
```bash
docker pull zhiyuc123/longport-mcp:latest
```

### 运行容器
```bash
docker run -d -e LONGPORT_APP_KEY=your-app-key -e LONGPORT_APP_SECRET=your-app-secret -e LONGPORT_ACCESS_TOKEN=your-access-token -p 8000:8000 zhiyuc123/longport-mcp:latest
```

✅ 默认以 **只读模式** 启动
❌ 默认禁用交易功能。

---

## ⚙️ 环境变量

| 名称 | 是否必须 | 描述 |
|------|-----------|-------------|
| `LONGPORT_APP_KEY` | ✅ | 长桥 OpenAPI 应用的 App Key |
| `LONGPORT_APP_SECRET` | ✅ | 长桥 OpenAPI 应用的 App Secret |
| `LONGPORT_ACCESS_TOKEN` | ✅ | 长桥 OpenAPI 的访问令牌 (Access Token) |
| `LONGPORT_MCP_READONLY` | ❌ | 以只读模式运行，禁用交易功能。将此环境变量设为false来放开交易功能 |

---


## 🧠 架构

支持以下架构：
- ✅ `linux/amd64` (x86 服务器)
- ✅ `linux/arm64` (Apple Silicon)

---

## 📜 许可协议

 Apache License, Version 2.0,([LICENSE](./LICENSE) or http://www.apache.org/licenses/LICENSE-2.0)