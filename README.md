# PS_WOL

## Overview

複数台のPCを一括で起動、再起動、終了させるためのPowerShell  

## Description

RemoteWakeUp.ps1 : 登録したPCを一括で起動する  

RemoteShutdown.ps1 : 登録したPCを一括で終了する  

RemoteReboot.ps1 : 登録したPCを一括で再起動する  

## Usage

(1) _SessionList.csvにPCを登録する

左からIPアドレス、ユーザー名、パスワード、MACアドレス

``` _SessionList.csv
IP,User,PW,MAC
192.168.1.101,Test_0,password,94-C6-91-14-38-51
192.168.1.102,Test_1,password,94-C6-91-14-32-BA

```

(2) 実行する  

ps1ファイルを右クリック > PowerShellで実行

## Settings

<details><summary>シャットダウン設定</summary><div>

(1) スタート→コントロールパネル→管理ツール→ローカルセキュリティポリシー→セキュリティの設定→ローカルポリシー→セキュリティオプション  

(2) 「ユーザーアカウント制御: 管理者承認モードですべての管理者を実行する」を無効に設定する  

(3)「ネットワーク アクセス:ローカル アカウントの共有とセキュリティ モデル」を「クラシック - ローカル ユーザがローカル ユーザとして認証する」に設定する
  
(4) 再起動  

</div></details>


<details><summary>WOL設定</summary><div>

(1) 高速スタートアップ無効

(2) BIOS > Chipset Conf > Deep Sleep > OFF

(3) BIOSからWOL,PCIE DeviceをEnable

(4) デバイスマネージャー>LANアダプター>詳細設定>プロパティ>Wake On Magic PaketをON
・Wake On Magic Paket = ON
・Energy Efficient Ethernet = OFF

(5) デバイスマネージャー>LANアダプター>電源管理> すべてチェック

・　電力節約のために、コンピュータでこのデバイスの電源をオフにできるようにする

・　このデバイスで、コンピュータのスタンバイ状態を解除できるようにする

・　Magic Packetでのみ、コンピュータのスタンバイ状態を解除できるようにする

[注意]  
 必ず電源喪失状態からWOLのテストをする事。電源獲得→正常終了→WOLは成功するが、電源喪失からのWOLは成功しない場合がある。この場合、LANアダプターの省エネ設定や電源獲得時の自動起動設定で解消できる。

[補足]  
 特定のIPにマジックパケットを投げる場合、ルーターのARPテーブルに存在していないIPは消去される。これを防止するためにはARPバインディングが必要となる（※もしくは特定のIPに投げるのを諦めてネットワーク上のすべてのPCにブロードキャストする）。テストした時は問題なくWOLできたいのに、長時間経った後でWOLに失敗する原因はARPテーブルの消去にある。


</div></details>