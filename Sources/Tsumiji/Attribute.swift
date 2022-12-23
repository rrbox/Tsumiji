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
    var fontColor: Color = .white
    var backgroundColor: Color = .clear
}

public extension AttributeContext {
    static func fontName(_ value: String) -> AttributeContext {
        .init(fontName: value)
    }
    static func fontSize(_ value: NSNumber) -> AttributeContext {
        .init(fontSize: value)
    }
    static func fontColor(_ value: Color) -> AttributeContext {
        .init(fontColor: value)
    }
    static func backgroundColor(_ value: Color) -> AttributeContext {
        .init(backgroundColor: value)
    }
}

public extension AttributeContext {
    func fontName(_ value: String) -> AttributeContext {
        var result = self
        result.fontName = value
        return result
    }
    func fontSize(_ value: NSNumber) -> AttributeContext {
        var result = self
        result.fontSize = value
        return result
    }
    func fontColor(_ value: Color) -> AttributeContext {
        var result = self
        result.fontColor = value
        return result
    }
    func backgroundColor(_ value: Color) -> AttributeContext {
        var result = self
        result.backgroundColor = value
        return result
    }
}
