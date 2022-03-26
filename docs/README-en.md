# つみじ Tsumiji

SwiftPM to create NSAttributedString with Builder pattern.

## DEMO

You can design an NSAttributedString as follows.

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

 An NSAttributedString is generated as follows.

<img width="402" alt="result_0" src="https://user-images.githubusercontent.com/87851278/160229559-24adf968-f90d-4341-b86a-636349319cd2.png">
