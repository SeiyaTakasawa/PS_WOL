# PS_WOL
====

##Overview

複数台のPCを一括で起動、再起動、終了させるためのPowerShell  

## Description

RemoteWakeUp.ps1 : 登録したPCを一括で起動する  

RemoteShutdown.ps1 : 登録したPCを一括で終了する  

RemoteReboot.ps1 : 登録したPCを一括で再起動する  

UAC無効 ( RemoteShutdown.ps1 )
(1) スタート→コントロールパネル→管理ツール→ローカルセキュリティポリシー→セキュリティの設定→ローカルポリシー→セキュリティオプション
(2) 「ユーザーアカウント制御: 管理者承認モードですべての管理者を実行する」を無効に設定する
(3)「ネットワーク アクセス:ローカル アカウントの共有とセキュリティ モデル」を「クラシック - ローカル ユーザがローカル ユーザとして認証する」に設定する
(4) 再起動


## Usage

ps1ファイルを右クリック > PowerShellで実行