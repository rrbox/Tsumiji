import XCTest
import SwiftUI
@testable import Tsumiji

#if os(macOS)
typealias Color = NSColor
#elseif os(iOS)
typealias Color = UIColor
#endif

extension Attribute {
    static let red: Self = [.fontColor: Color.red]
}

final class TsumijiTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        
        
        let editor = Editor()
            .font(.red)
            .text("Sample")
            .fontEnd()
        
        print(editor.product)
        
        let editedString: EditorLiteral = "hello\(.red), world\(.fontEnd)."
        
        print(editedString.product)
        
    }
}

