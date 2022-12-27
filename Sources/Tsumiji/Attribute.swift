//
//  Tsumiji.swift
//
//
//  Created by rrbox on 2022/02/09.
//

import SwiftUI

#if os(iOS)
public typealias Scopes = AttributeScopes.UIKitAttributes
#elseif os(macOS)
public typealias Scopes = AttributeScopes.AppKitAttributes
#endif

struct AttributeContext {
    var fontName: String = "HelveticaNeue-UltraLight"
    var fontSize: NSNumber = NSNumber(value: 32)
    var foregroundColor: Scopes.ForegroundColorAttribute.Value = .white
    var backgroundColor: Scopes.BackgroundColorAttribute.Value = .clear
}

enum AttributeElement {
    case fontName(String)
    case fontSize(NSNumber)
    case foregroundColor(Scopes.ForegroundColorAttribute.Value)
    case backgroundColor(Scopes.BackgroundColorAttribute.Value)
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
    static func foregroundColor(_ value: Scopes.ForegroundColorAttribute.Value) -> Attribute {
        .init(body: .single(.foregroundColor(value)))
    }
    static func backgroundColor(_ value: Scopes.BackgroundColorAttribute.Value) -> Attribute {
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
    func foregroundColor(_ value: Scopes.ForegroundColorAttribute.Value) -> Attribute {
        .init(body: .link(self.body, .foregroundColor(value)))
    }
    func backgroundColor(_ value: Scopes.BackgroundColorAttribute.Value) -> Attribute {
        .init(body: .link(self.body, .backgroundColor(value)))
    }
}
