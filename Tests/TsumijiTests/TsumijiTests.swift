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

extension Attribute {
    static let red: Self = [.fontColor: Color.red]
    static let big: Self = [.fontSize: 50]
    static let impact: Self = [.fontName: "impact"]
    static let redBack: Self = [.backgroundColor: Color.red]
}

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

final class TsumijiTests: XCTestCase {
    
    func testExample() throws {
        
        let attrCase = NSMutableAttributedString()
        attrCase.append(NSAttributedString(string: "color", attributes: [
            .font: Font.default!,
            .foregroundColor: Color.red,
            .backgroundColor: Color.defaultBackground
        ]))
        attrCase.append(NSAttributedString(string: "fontSize", attributes: [
            .font: Font(name: .defaultFontName, size: 50)!,
            .foregroundColor: Color.default,
            .backgroundColor: Color.defaultBackground
        ]))
        attrCase.append(NSAttributedString(string: "fontName", attributes: [
            .font: Font(name: "impact", size: .defaultFontSize)!,
            .foregroundColor: Color.default,
            .backgroundColor: Color.defaultBackground
        ]))
        attrCase.append(NSAttributedString(string: "backgroundColor", attributes: [
            .font: Font.default!,
            .foregroundColor: Color.default,
            .backgroundColor: Color.red
        ]))
        
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
            .font(.redBack)
            .text("backgroundColor")
            .fontEnd()
            
        
        XCTAssertEqual(editor.product, AttributedString(attrCase))
        
        // test : editor literal
        let editedLiteral: EditorLiteral = "\(.red)color\(.fontEnd)\(.big)fontSize\(.fontEnd)\(.impact)fontName\(.fontEnd)\(.redBack)backgroundColor\(.fontEnd)"
        
        XCTAssertEqual(editedLiteral.product, AttributedString(attrCase))
        
    }
    
}

