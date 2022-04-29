import XCTest
import SwiftUI
@testable import Tsumiji

extension Attribute {
    static let red: Self = [.fontColor: NSColor.red]
}

typealias NSAttribute = [NSAttributedString.Key: Any?]

#if os(macOS)
typealias Font = NSFont
typealias Color = NSColor
#elseif os(iOS)
typealias Font = UIFont
typealias Color = UIColor
#endif

extension Font {
    static let `default` = Font(name: "HelveticaNeue-UltraLight", size: 32)
}

extension Color {
    static let `default` = Color.white
    static let defaultBackground = Color.clear
}

final class TsumijiTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let attr = NSMutableAttributedString()
        attr.append(NSAttributedString(string: "Sample", attributes: [
            .font: Font.default!,
            .foregroundColor: Color.red,
            .backgroundColor: Color.defaultBackground
        ]))
        
        let editor = Editor()
            .font(.red)
            .text("Sample")
            .fontEnd()
        
        XCTAssertEqual(editor.product, AttributedString(attr))
        
        let editedLiteral: EditorLiteral = "\(.red)Sample\(.fontEnd)"
        
        XCTAssertEqual(editedLiteral.product, AttributedString(attr))
        
    }
}

