# つみじ Tsumiji

[![GitHub issues](https://img.shields.io/github/issues/rrbox/Tsumiji)](https://github.com/rrbox/Tsumiji/issues)
[![GitHub license](https://img.shields.io/github/license/rrbox/Tsumiji)](https://github.com/rrbox/Tsumiji/blob/main/LICENSE)

:paperclip:[English](README_en.md)

AttributedString を Builder パターンや, 文字列リテラルで作成する SwiftPM です.

## Overview

Tsumiji を一言で表すと, **構造化された Attributed String** です.

- XML のタグのように, 文字の一部を `.font(_ attribute: Attribute)` と `.fontEnd()` で入れ子状に挟むことができます.
- アトリビュートが入れ子状になると, **アトリビュートの合成**が起こります.

## DEMO

### Builder パターンでの設計

``` swift
extension Attribute {
    static let impact: Attribute = [.fontName: "Impact"]
    static let red: Attribute = [.fontColor: UIColor.red]
}


let attrtext = Editor()
    .font(.impact).font(.red).text("Hello,").fontEnd().text(" World!\n")
    .font(.red).text("Hi").fontEnd().text("こんにちはこんにちは!!")
    .product
```

 生成された AttributedString を表示したものがこちら.

<img width="200" alt="result_0" src="https://user-images.githubusercontent.com/87851278/160229559-24adf968-f90d-4341-b86a-636349319cd2.png">

### 文字列リテラルでの設計

```swift
extension Attribute {
    static let red: Self = [.fontColor: NSColor.red]
    static let impact: Self = [.fontName: "Impact"]
    static let roman: Self = [.fontName: "times new roman"]
}

let editor: EditorLiteral = "\(.roman)He\(.fontEnd)\(.impact)l\(.fontEnd)lo, \(.red)literal\(.fontEnd)\(.impact)!\(.fontEnd)"

// get attributed string.
editor.product
```

生成された　AttributedString を表示したものがこちら.

<img width="200" alt="result_1" src="https://user-images.githubusercontent.com/87851278/161392170-6075be93-dd76-46a8-aad4-85e7c6cd4060.png">

