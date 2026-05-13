# bin

個人工具腳本集，已加入 `$PATH`，可直接在終端機呼叫。

## 腳本

| 指令 | 說明 |
|------|------|
| `start-all` | 啟動所有本機 AI 服務 |
| `hm` | Hermes 模型快速切換（本地 + 雲端） |
| `b44-info` | 顯示 Hermes Dashboard API Token 與連線資訊 |
| `ocpaste` | 剪貼簿 / 截圖 → AI 分析 → OpenClaw |
| `clipboard-png-daemon` | X11 剪貼簿 BMP→PNG 自動轉換 |

## 快速示例

```bash
start-all              # 啟動所有服務
hm                     # 選擇 AI 模型互動選單
hm hermes3-3b          # 直接啟動指定模型
b44-info               # 查看 API Token
ocpaste --screenshot   # 截圖後 AI 分析
```

## 相關 Repo

| Repo | 說明 |
|------|------|
| [ai_projects](https://github.com/comtnet86city-debug/ai_projects) | AI 腳本集 |
| [hermes-dashboard](https://github.com/comtnet86city-debug/hermes-dashboard) | Web 控制台 |
| [claude-workspace](https://github.com/comtnet86city-debug/claude-workspace) | 完整工作區文件 |
