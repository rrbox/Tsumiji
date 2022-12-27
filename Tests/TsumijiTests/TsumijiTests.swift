import XCTest
import SwiftUI
@testable import Tsumiji

#if os(macOS)
typealias Font = NSFont
typealias Color = NSColor
#elseif os(iOS)
typealias Font = UIFont
typealias Color = UIColor
#endif

extension String {
    static let defaultFontName = "HelveticaNeue-UltraLight"
}

extension CGFloat {
    static let defaultFontSize = CGFloat(32)
}

extension Font {
    static let `default` = Font(name: "HelveticaNeue-UltraLight", size: 32)
}

extension Color {
    static let `default` = Color.white
    static let defaultBackground = Color.clear
}

extension Attribute {
    static let red: Self = .foregroundColor(.red)
    static let big: Self = .fontSize(50)
    static let impact: Self = .fontName("times")
    static let blueBack: Self = .backgroundColor(.blue)
    static let wideKern: Self = .kern(10)
    
    static let bigRed: Self = .fontSize(50).foregroundColor(.red)
}

final class TsumijiTests: XCTestCase {
    
    var singleElement = AttributedString()
    var complexElement = AttributedString()
    
    override func setUp() {
        
        
    }
    
    override func setUp() async throws {
        
        var color = AttributedString("color")
        color.font = Font.default!
        color.foregroundColor = Color.red
        color.backgroundColor = .defaultBackground
        color.kern = 0
        singleElement += color
        
        var fontSize = AttributedString("fontSize")
        fontSize.font = Font(name: .defaultFontName, size: 50)!
        fontSize.foregroundColor = .default
        fontSize.backgroundColor = .defaultBackground
        fontSize.kern = 0
        singleElement += fontSize
        
        var fontName = AttributedString("fontName")
        fontName.font = Font(name: "times", size: .defaultFontSize)!
        fontName.foregroundColor = .default
        fontName.backgroundColor = .defaultBackground
        fontName.kern = 0
        singleElement += fontName
        
        var backgroundColor = AttributedString("backgroundColor")
        backgroundColor.font = .default
        backgroundColor.foregroundColor = .default
        backgroundColor.backgroundColor = Color.blue
        backgroundColor.kern = 0
        singleElement += backgroundColor
        
        var kern = AttributedString("wideKern")
        kern.font = .default
        kern.foregroundColor = .default
        kern.backgroundColor = .defaultBackground
        kern.kern = 10
        singleElement += kern
        
        var colorBackground = AttributedString("color + backgroundColor")
        colorBackground.font = .default
        colorBackground.foregroundColor = Color.red
        colorBackground.backgroundColor = Color.blue
        colorBackground.kern = 0
        complexElement += colorBackground
        
        var fontSizeColor = AttributedString("fontSize + color")
        fontSizeColor.font = Font(name: .defaultFontName, size: 50)!
        fontSizeColor.foregroundColor = Color.red
        fontSizeColor.backgroundColor = .defaultBackground
        fontSizeColor.kern = 0
        complexElement += fontSizeColor
        
    }
    
    func testEditor() throws {
        
        // test : builder pattern
        let editor = Editor()
            .font(.red)
            .text("color")
            .fontEnd()
            .font(.big)
            .text("fontSize")
            .fontEnd()
            .font(.impact)
            .text("fontName")
            .fontEnd()
            .font(.blueBack)
            .text("backgroundColor")
            .fontEnd()
            .font(.wideKern)
            .text("wideKern")
            .fontEnd()
            
        XCTAssertEqual(editor.product, singleElement)
        
    }
    
    func testLiteral() throws {
        
        // test : editor literal
        let editedLiteral: EditorLiteral = "\(.red)color\(.fontEnd)\(.big)fontSize\(.fontEnd)\(.impact)fontName\(.fontEnd)\(.blueBack)backgroundColor\(.fontEnd)"
        
        XCTAssertEqual(editedLiteral.product, singleElement)
        
    }
    
    func testComplexElementEditor() throws {
        let editor = Editor()
            .font(.red)
            .font(.blueBack)
            .text("color + backgroundColor")
            .fontEnd()
            .fontEnd()
            .font(.bigRed)
            .text("fontSize + color")
            .fontEnd()
        
        XCTAssertEqual(editor.product, complexElement)
    }
    
    func testComplexElementLiteral() throws {
        
        let editedLiteral: EditorLiteral = "\(.red)\(.blueBack)color + backgroundColor\(.fontEnd)\(.fontEnd)\(.bigRed)fontSize + color\(.fontEnd)"
        
        XCTAssertEqual(editedLiteral.product, complexElement)
        
    }
    
}

