# Deprecations

## iOS7, drawInRectメソッドの改修

- warning

```
'drawInRect:withFont:lineBreakMode:alignment:' is deprecated: first deprecated in iOS 7.0 - Use -drawInRect:withAttributes:
```

## 対応

```
NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
   textStyle.alignment = text.mAlign;
   textStyle.lineBreakMode = text.mLineBreakMode;
   NSDictionary* textAttributes = @{NSFontAttributeName:text.mFont, NSParagraphStyleAttributeName: textStyle, NSForegroundColorAttributeName: text.mFontColor};
   [text.mString drawInRect:text.mArea withAttributes:textAttributes];
```
