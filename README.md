# つみじ Tsumiji

NSAttributedString を Builder パターンで作成する SwiftPM です。

## DEMO

このように NSAttributedString を設計できます.

``` swift
extension Attribute {
    static let impact = Attribute(attribute: [.fontName: "Impact"])
    static let red = Attribute(attribute: [.fontColor: UIColor.red])
}


let attrtext = Editor()
    .font(.impact).font(.red).text("Hello,").fontEnd().text(" World!\n")
    .font(.red).text("Hi").fontEnd().text("こんにちはこんにちは!!")
    .product
```

 生成された NSAttributedString を表示すると, この写真のようになります.

<img width="402" alt="result_0" src="https://user-images.githubusercontent.com/87851278/160229559-24adf968-f90d-4341-b86a-636349319cd2.png">
