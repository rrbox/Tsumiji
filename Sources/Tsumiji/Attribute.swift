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
typealias Font = UIFont
typealias Color = UIColor
#elseif os(macOS)
typealias Font = NSFont
typealias Color = NSColor
#endif

public enum AttributeKey {
    case fontName, fontSize, fontColor, backgroundColor
}

public typealias Attribute = [AttributeKey: Any]

public struct BuilderAttribute {
    var fontColor: Color
}
