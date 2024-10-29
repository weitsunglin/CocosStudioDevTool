# CocosStudio_DevTool

- 自動同步資源 重啟 visual studio 並 執行 Debug 的工具

- 使用 Visual Studio 2013，安裝路徑為系統預設

- 安裝 auto hit key v1.1.37.02，安裝後位置在: C:\Program Files\AutoHotkey

## 使用流程 (調整 lua)

- inanna lua resources folder → Visual Studio debug folder → 重啟 Visual Studio

1. 編輯 lua 代碼
2. Visual studio 尚未開啟 or Visual studio 正在 Debug
3. 執行 start_ffs_batch.bat

## 使用流程 (調整 cocos)

- studio 圖片 → inanna resources folder → res folder → inanna resources folder → Visual Studio debug folder → 重啟 Visual Studio

1. 編輯 cocos studio
2. Visual studio 尚未開啟 or Visual studio 正在 Debug
3. 執行 coco_studio_build_csb.bat
4. 輸入的參數可是: ALL 或 指定模組

## 補充

1. 此倉庫的環境設定跟您的不一樣，所以檔案中的路徑要自己替換!!
2. 不提供到府安裝的服務
3. studio 圖片 → inanna resources folder 會做這段流程是因為編出來的資源，如果節點沒引用 x 圖片，x 圖片就不會跟著出去!
