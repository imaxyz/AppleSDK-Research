# WIP: Apple SDK Research Template

AppleのSDKを検証する時に使える、雛形のプロジェクトです。
	   
![connect to exit](https://github.com/YI201610/AppleSDK-Research-Template/blob/develop/images/sim2.png)

## 目的

- 複数の検証項目を、1つのアプリにまとめられる環境を提供する。
- 検証項目を追加する際、決まりきった作業の量を減らす。

## 用例

- 新しいプロジェクトを担当する際、迅速に、そのプロジェクト専用の新規の検証環境を作る。
- 異なるiOSバージョンで、継続して動作確認を行う。
   - (e.g.) ベータ版iOSでの動作検証を、継続して実施する。  
   - (e.g.) UIKitの仕様が変更になった時、レイアウト崩れがないか。レイアウトの実装方法は妥当か。
- 検証項目を分割し、チームメンバーが並列して分割された各検証項目の検証を進める。

## プロジェクト構成の概要

:warning: 暫定のプロジェクト構成を組んでいるため、今後変更になる可能性があります。

```
├── AppleSDKTips
│   ├── Application ... (a)
│   └── Framework ..... (b)
```

- (a) ... ここに検証項目に対応するViewControllerを追加する
- (b) ... `Apple SDK Reserch Template` アプリのフレームワーク。基本は触らない。

```
├── AppleSDKTips
│   ├── Application
│   │   └── Resource
│   │       └── topMenu.plist ... (c) 

```

- (c) ... 検証項目のメニューを定義する。plist形式。テキストエディタで編集して、検証項目を追加する。


## 使い方

1. プロジェクトをXcodeで開く

2. `src/AppleSDKTips/Application/Resource/topMenu.plist` をテキストエディタで編集し、新しい検証項目を追加する。
  - 各項目は、 `title` と `vc` (ViewController) から構成する。
    - 次の例では、 titleに「検証項目1」、 vcに「SampleViewController」を指定している。
	   - ![connect to exit](https://github.com/YI201610/AppleSDK-Research-Template/blob/develop/images/2.png)

```
<key>title</key>
<string>サンプルタイトル1</string>
<key>vc</key>
<string>SampleViewController</string>
```

3. 「2.」の「vc」で指定したViewControllerを、プロジェクトに追加する。

4. 「2.」で追加したvcと全く同名のStoryboardをプロジェクトに追加する。
  - そのStoryboardに、NavigationControllerと、rootViewControllerを追加する。

    - NavigationControllerの `Is Initial View Controller` のチェックボックスをONにする。
	  - ![check - is initial view controller](https://github.com/YI201610/AppleSDK-Research-Template/blob/develop/images/4.png)

    - rootViewControllerに、「2.」で追加したvcを設定する。
    - rootViewControllerに、BarButtonItemを追加する。テキスト文字を「戻る」と入力する。
	  - BarButtonItemを「Exit」に接続し、Unwind Segueの「backToTop」にを選択する。
	     - ![connect to exit](https://github.com/YI201610/AppleSDK-Research-Template/blob/develop/images/1.png)
	     - ![connect to exit](https://github.com/YI201610/AppleSDK-Research-Template/blob/develop/images/3.png)

5. アプリを起動し、検証項目を選択する
  - 「4.」で追加したStoryboardを経て、「3.」で追加したViewControllerが表示されることを確認する。

6. 「3.」で追加したViewControllerに検証したい内容を実装する。


## License
AppleSDK-Research-Template is licensed under the MIT license.
