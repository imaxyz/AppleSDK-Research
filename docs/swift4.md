
# Swift4

## Swift4で@objcに関する解釈が変更になった件への対応

### warning

```
Swift property 'XXXXViewController.yyyyy' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint
```

### 考察

- 一括してクラス宣言の先頭に``@objc``キーワードを付加していた箇所が影響する。
  - swift4からは、必要最小限の箇所に``@objc``キーワードを付加することになった。

### 対応

- クラス宣言の先頭に付加していた、@objcキーワードを削除した
- 関連する具体的なメソッドに対して、先頭に@objcを付与した


### 参考資料
- https://github.com/apple/swift-evolution/blob/master/proposals/0160-objc-inference.md
