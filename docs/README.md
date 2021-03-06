# つみじ Tsumiji

:paperclip:[English](README_en.md)

AttributedString を Builder パターンや, 文字列リテラルで作成する SwiftPM です。

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

