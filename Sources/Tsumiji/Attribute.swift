//
//  Tsumiji.swift
//
//
//  Created by rrbox on 2022/02/09.
//

#if os(macOS)
import AppKit
#elseif os(iOS)
import AppKit
#endif

#if os(iOS)
public typealias Font = UIFont
public typealias Color = UIColor
#elseif os(macOS)
public typealias Font = NSFont
public typealias Color = NSColor
#endif

public struct AttributeContext {
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

public indirect enum Attribute {
    case single(AttributeElement)
    case link(Self, AttributeElement)
}

public extension Attribute {
    static func fontName(_ value: String) -> Attribute {
        .single(.fontName(value))
    }
    static func fontSize(_ value: NSNumber) -> Attribute {
        .single(.fontSize(value))
    }
    static func fontColor(_ value: Color) -> Attribute {
        .single(.foregroundColor(value))
    }
    static func backgroundColor(_ value: Color) -> Attribute {
        .single(.backgroundColor(value))
    }
}

public extension Attribute {
    func fontName(_ value: String) -> Attribute {
        .link(self, .fontName(value))
    }
    func fontSize(_ value: NSNumber) -> Attribute {
        .link(self, .fontSize(value))
    }
    func fontColor(_ value: Color) -> Attribute {
        .link(self, .foregroundColor(value))
    }
    func backgroundColor(_ value: Color) -> Attribute {
        .link(self, .backgroundColor(value))
    }
}
