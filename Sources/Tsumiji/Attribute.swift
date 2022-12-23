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

public enum AttributeKey {
    case fontName, fontSize, fontColor, backgroundColor
}

public typealias Attribute = [AttributeKey: Any]

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

public indirect enum AttributeLink {
    case single(AttributeElement)
    case link(Self, AttributeElement)
}

public extension AttributeLink {
    static func fontName(_ value: String) -> AttributeLink {
        .single(.fontName(value))
    }
    static func fontSize(_ value: NSNumber) -> AttributeLink {
        .single(.fontSize(value))
    }
    static func fontColor(_ value: Color) -> AttributeLink {
        .single(.foregroundColor(value))
    }
    static func backgroundColor(_ value: Color) -> AttributeLink {
        .single(.backgroundColor(value))
    }
}

public extension AttributeLink {
    func fontName(_ value: String) -> AttributeLink {
        .link(self, .fontName(value))
    }
    func fontSize(_ value: NSNumber) -> AttributeLink {
        .link(self, .fontSize(value))
    }
    func fontColor(_ value: Color) -> AttributeLink {
        .link(self, .foregroundColor(value))
    }
    func backgroundColor(_ value: Color) -> AttributeLink {
        .link(self, .backgroundColor(value))
    }
}
