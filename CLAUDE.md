# ~/bin — 個人工具腳本集

**GitHub:** `comtnet86city-debug/bin`

`~/bin/` 已加入 `$PATH`，所有腳本可直接在終端機呼叫。

## 腳本清單

| 腳本 | 說明 |
|------|------|
| `start-all` | 啟動全部 AI 服務 |
| `hm` | Hermes 模型快速切換 |
| `b44-info` | Hermes Dashboard API 連線資訊 |
| `ocpaste` | 剪貼簿/截圖圖片 → AI 分析 → OpenClaw |
| `clipboard-png-daemon` | X11 剪貼簿 BMP→PNG 自動轉換（背景常駐）|
| `start-clipboard-daemon.sh` | 啟動 clipboard-png-daemon |

---

## start-all

啟動所有本機 AI 服務，依序確認並啟動：

```bash
start-all
```

啟動順序與服務：

| 服務 | Port | 啟動方式 |
|------|------|---------|
| Open-WebUI | 8080 | `docker start open-webui` |
| n8n | 5678 | `docker start n8n` |
| SearXNG | 8888 | `docker start searxng` |
| Langfuse | 3000 | `docker compose up -d`（`~/langfuse/`）|
| 設計協作平台 | 9001 | `docker compose up -d`（`~/penpot/`）|
| 設計協作倉庫 | 3001 | `docker compose up -d`（`~/gitea/`）|
| ComfyUI | 8188 | `bash ~/ComfyUI/start.sh` |
| Claude Bridge | 19001 | `bash ~/ai_projects/claude_bridge/start.sh` |
| Hermes Dashboard | 7860 | `uvicorn main:app`（`~/hermes-dashboard/`）|

已在運行的服務會直接跳過，不會重複啟動。

---

## hm

Hermes agent 模型快速切換，支援本地 Ollama 與雲端模型。

```bash
hm                  # 互動選單
hm local-ollama     # 直接啟動指定模型
hm gemini-flash     # 雲端 Gemini
hm gpt-5-4          # 透過 OpenClaw 開啟 Web UI
```

**可用模型：**

| 別名 | 模型 | 速度 | 特點 |
|------|------|------|------|
| `local-ollama` | qwen3.6:latest | 8 tok/s | GPU+RAM，中文最佳 |
| `hermes3-3b` | hermes3:3b | 46 tok/s | GPU 全速，工具使用 |
| `qwen-coder` | qwen2.5-coder:7b | 12 tok/s | 程式碼生成 |
| `qwen3-8b` | qwen3:8b | 8 tok/s | 推理 |
| `hermes3-large` | hermes3:latest | 40 tok/s | 均衡 |
| `qwen-27b` | qwen3.6:27b-q4_K_M | 2 tok/s | CPU，高品質 |
| `gemini-flash` | gemini-2.5-flash | 雲端 | 1M context ☁ |
| `gpt-5-4` | gpt-5.4 | 雲端 | OpenClaw Web UI ☁ |
| `gpt-5-5` | gpt-5.5 | 雲端 | OpenClaw Web UI ☁ |

雲端模型（gpt-5.x）透過 OpenClaw gateway 的 Web UI 使用；gemini 透過 hermes `--provider` 參數。備援鏈：`local-ollama → hermes3-3b → hermes3-large`。

---

## b44-info

顯示 Hermes Dashboard 的連線資訊與 API Token，供 Base44 等外部平台串接。

```bash
b44-info
```

輸出內容：
- Dashboard 在線狀態
- 本機 / Tailscale / 公網 URL
- API Token（讀自 `~/.hermes_token`）
- 所有 `/api/b44/*` 端點說明
- 可直接貼上的 `curl` 測試指令

---

## ocpaste

剪貼簿或截圖圖片 → moondream 辨識 → qwen3.6 繁中解說 → 送入 OpenClaw。

```bash
ocpaste                        # 從剪貼簿讀取圖片
ocpaste ~/桌面/photo.jpg        # 指定圖片檔案
ocpaste --screenshot           # 截圖選取區域（需 scrot）
ocpaste --no-agent             # 只分析，不送 OpenClaw
```

實際執行 `~/ai_projects/vision/ocpaste.py`，自動啟用 `ai_agent_env`。

---

## clipboard-png-daemon / start-clipboard-daemon.sh

監控 X11 剪貼簿，自動將 BMP 格式（Windows 截圖貼上時常見）轉換為 PNG，讓 `ocpaste` 等工具能正確讀取。

```bash
# 手動啟動（背景常駐）
bash ~/bin/start-clipboard-daemon.sh

# 查看日誌
tail -f ~/ai_projects/logs/clipboard-daemon.log
```

輪詢間隔：0.6 秒。日誌：`~/ai_projects/logs/clipboard-daemon.log`。

## 參見

完整工作區環境說明（LLM 模型、外部服務、OpenClaw、所有 repo 清單）：
`comtnet86city-debug/claude-workspace` → `~/CLAUDE.md`
