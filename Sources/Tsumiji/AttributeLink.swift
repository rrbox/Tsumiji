//
//  Tsumiji.swift
//
//
//  Created by rrbox on 2022/02/09.
//

#if os(macOS)
import AppKit
#elseif os(iOS)
import UIKit
#endif

#if os(iOS)
public typealias Font = UIFont
public typealias Color = UIColor
#elseif os(macOS)
public typealias Font = NSFont
public typealias Color = NSColor
#endif

struct AttributeContext {
    var fontName: String = "HelveticaNeue-UltraLight"
    var fontSize: NSNumber = NSNumber(value: 32)
    var foregroundColor: Color = .white
    var backgroundColor: Color = .clear
}

public enum AttributeElement {
    case fontName(String)
    case fontSize(NSNumber)
    case foregroundColor(Color)
    case backgroundColor(Color)
}

indirect enum AttributeLink {
    case single(AttributeElement)
    case link(Self, AttributeElement)
}

public struct Attribute {
    let body: AttributeLink
    init(body: AttributeLink) {
        self.body = body
    }
}

public extension Attribute {
    static func fontName(_ value: String) -> Attribute {
        .init(body: .single(.fontName(value)))
    }
    static func fontSize(_ value: NSNumber) -> Attribute {
        .init(body: .single(.fontSize(value)))
    }
    static func foregroundColor(_ value: Color) -> Attribute {
        .init(body: .single(.foregroundColor(value)))
    }
    static func backgroundColor(_ value: Color) -> Attribute {
        .init(body: .single(.backgroundColor(value)))
    }
}

public extension Attribute {
    func fontName(_ value: String) -> Attribute {
        .init(body: .link(self.body, .fontName(value)))
    }
    func fontSize(_ value: NSNumber) -> Attribute {
        .init(body: .link(self.body, .fontSize(value)))
    }
    func foregroundColor(_ value: Color) -> Attribute {
        .init(body: .link(self.body, .foregroundColor(value)))
    }
    func backgroundColor(_ value: Color) -> Attribute {
        .init(body: .link(self.body, .backgroundColor(value)))
    }
}
