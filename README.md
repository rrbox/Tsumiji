# つみじ Tsumiji

NSAttributedString を Builder パターンで作成する SwiftPM です。

## DEMO

このように NSAttributedString を設計できます.

``` swift
let attrtext = Editor()
    .tag(.impact).tag(.red).text("Hello,").tagEnd().text(" World!\n")
    .tag(.red).text("Hi").tagEnd().text("こんにちはこんにちは!!")
    .product
```

 生成された NSAttributedString を表示すると, この写真のようになります.

<img width="402" alt="result_0" src="https://user-images.githubusercontent.com/87851278/160229559-24adf968-f90d-4341-b86a-636349319cd2.png">
