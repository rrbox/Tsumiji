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
    static let red: Self = .fontColor(.red)
    static let big: Self = .fontSize(50)
    static let impact: Self = .fontName("times")
    static let blueBack: Self = .backgroundColor(.blue)
    
    static let bigRed: Self = .fontSize(50).fontColor(.red)
}

final class TsumijiTests: XCTestCase {
    
    let singleElementAttrCase = NSMutableAttributedString()
    let complexElemetAttrCase = NSMutableAttributedString()
    
    override func setUp() async throws {
        
        singleElementAttrCase.append(NSAttributedString(string: "color", attributes: [
            .font: Font.default!,
            .foregroundColor: Color.red,
            .backgroundColor: Color.defaultBackground
        ]))
        singleElementAttrCase.append(NSAttributedString(string: "fontSize", attributes: [
            .font: Font(name: .defaultFontName, size: 50)!,
            .foregroundColor: Color.default,
            .backgroundColor: Color.defaultBackground
        ]))
        singleElementAttrCase.append(NSAttributedString(string: "fontName", attributes: [
            .font: Font(name: "times", size: .defaultFontSize)!,
            .foregroundColor: Color.default,
            .backgroundColor: Color.defaultBackground
        ]))
        singleElementAttrCase.append(NSAttributedString(string: "backgroundColor", attributes: [
            .font: Font.default!,
            .foregroundColor: Color.default,
            .backgroundColor: Color.blue
        ]))
        
        complexElemetAttrCase.append(NSAttributedString(string: "color + backgroundColor", attributes: [
            .font: Font.default!,
            .foregroundColor: Color.red,
            .backgroundColor: Color.blue
        ]))
        complexElemetAttrCase.append(NSAttributedString(string: "fontSize + color", attributes: [
            .font: Font(name: .defaultFontName, size: 50)!,
            .foregroundColor: Color.red,
            .backgroundColor: Color.defaultBackground
        ]))
        
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
            
        XCTAssertEqual(editor.product, AttributedString(singleElementAttrCase))
        
    }
    
    func testLiteral() throws {
        
        // test : editor literal
        let editedLiteral: EditorLiteral = "\(.red)color\(.fontEnd)\(.big)fontSize\(.fontEnd)\(.impact)fontName\(.fontEnd)\(.blueBack)backgroundColor\(.fontEnd)"
        
        XCTAssertEqual(editedLiteral.product, AttributedString(singleElementAttrCase))
        
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
        
        XCTAssertEqual(editor.product, AttributedString(complexElemetAttrCase))
    }
    
    func testComplexElementLiteral() throws {
        
        let editedLiteral: EditorLiteral = "\(.red)\(.blueBack)color + backgroundColor\(.fontEnd)\(.fontEnd)\(.bigRed)fontSize + color\(.fontEnd)"
        
        XCTAssertEqual(editedLiteral.product, AttributedString(complexElemetAttrCase))
        
    }
    
}

