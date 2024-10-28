# sync_data_restar_debug_tool

自動同步資源 重啟 visual studio 並 執行 Debug 的工具

使用 Visual Studio 2013，安裝路徑為系統預設

## 使用流程

1. 安裝 auto hit key v1.1.37.02，安裝後位置在: C:\Program Files\AutoHotkey
2. ffs_batch 調整同步資源的目錄
3. restart.bat 調整鍵盤事件檔案位置目錄
4. 執行 start.bat 及可使用
5. 執行過程中，不要切換到視窗

## 工具運行流程

1. 同步檔案
2. 檢查 visual studio 是否開啟

- 是: 發送鍵盤事件
- 否: 啟動 visual studio sln 檔案

3. 執行鍵盤事件 ctrl shift f5 , Restart visual studio
