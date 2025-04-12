#Requires AutoHotkey v2.0

; 対象ディレクトリ（パスを適宜変更）
imageDir := "E:\___DUMMY___\__auto_fix__"

MsgBox "画像ディレクトリ: " imageDir

; 対象の拡張子一覧
extList := ["jpg", "png"]

; 拡張子ごとに処理ループ
for ext in extList {
    Loop Files imageDir "\*." ext, "F"
    {
        processImage(A_LoopFilePath)
    }
}

; --- 共通処理関数 ---
processImage(filePath) {
    ; MsgBox "画像処理中: " filePath

    ; 画像を「フォト」アプリで開く
    Run filePath
    Sleep 1500

    ; 編集モードに切り替え
    Send "^e"
    Sleep 2000

    ; 「フィルター」を選択
    Loop 4 {
        Send "{Tab}"
        Sleep 100
    }
    Loop 2 {
        Send "{Right}"
        Sleep 100
    }
    Send "{Enter}"
    Sleep 100

    ; 「フィルター」の「自動補正」を選択
    Loop 4 {
        Send "{Tab}"
        Sleep 100
    }

    Send "{Enter}"
    Sleep 100

    ; 「保存オプション」を選択
    Loop 3 {
        Send "+{Tab}"
        Sleep 100
    }
    Send "{Enter}"
    Sleep 100

    ; 「保存」を選択
    Loop 1 {
        Send "{Down}"
        Sleep 100
    }
    Send "{Enter}"
    Sleep 1000

    ; 「フォト」アプリを閉じる
    Send "!{F4}"
    Sleep 1000
}

MsgBox "処理が完了しました。"
