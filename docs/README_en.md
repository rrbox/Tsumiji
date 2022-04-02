# つみじ Tsumiji

SwiftPM for creating AttributedString with Builder pattern or string literals.

## DEMO

You can design an NSAttributedString like this:

``` swift
extension Attribute {
    static let impact: Attribute = [.fontName: "Impact"].
    static let red: Attribute = [.fontColor: UIColor.red].
}


let attrtext = Editor()
    .font(.impact).font(.red).text("Hello,").fontEnd().text(" World!\n")
    .font(.red).text("Hi").fontEnd().text("Hello Hello!")
    .product
````

It is created like this:

<img width="402" alt="result_0" src="https://user-images.githubusercontent.com/87851278/160229559-24adf968-f90d-4341-b86a-636349319cd2.png">
