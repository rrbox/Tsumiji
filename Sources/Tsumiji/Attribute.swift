//
//  Tsumiji.swift
//
//
//  Created by rrbox on 2022/02/09.
//

import SwiftUI

#if os(iOS)
public typealias Scope = AttributeScopes.UIKitAttributes
#elseif os(macOS)
public typealias Scope = AttributeScopes.AppKitAttributes
#endif

struct AttributeContext {
    var fontName: String = "HelveticaNeue-UltraLight"
    var fontSize: NSNumber = NSNumber(value: 32)
    var container: AttributeContainer = AttributeContainer()
}

enum AttributeElement {
    case fontName(String)
    case fontSize(NSNumber)
    case foregroundColor(Scope.ForegroundColorAttribute.Value)
    case backgroundColor(Scope.BackgroundColorAttribute.Value)
    case kern(Scope.KernAttribute.Value)
    case tracking(Scope.TrackingAttribute.Value)
    case baselineOffset(Scope.BaselineOffsetAttribute.Value)
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
    static func foregroundColor(_ value: Scope.ForegroundColorAttribute.Value) -> Attribute {
        .init(body: .single(.foregroundColor(value)))
    }
    static func backgroundColor(_ value: Scope.BackgroundColorAttribute.Value) -> Attribute {
        .init(body: .single(.backgroundColor(value)))
    }
    static func kern(_ value: Scope.KernAttribute.Value) -> Attribute {
        .init(body: .single(.kern(value)))
    }
    static func tracking(_ value: Scope.TrackingAttribute.Value) -> Attribute {
        .init(body: .single(.tracking(value)))
    }
    static func baselineOffset(_ value: Scope.BaselineOffsetAttribute.Value) -> Attribute {
        .init(body: .single(.baselineOffset(value)))
    }
}

public extension Attribute {
    func fontName(_ value: String) -> Attribute {
        .init(body: .link(self.body, .fontName(value)))
    }
    func fontSize(_ value: NSNumber) -> Attribute {
        .init(body: .link(self.body, .fontSize(value)))
    }
    func foregroundColor(_ value: Scope.ForegroundColorAttribute.Value) -> Attribute {
        .init(body: .link(self.body, .foregroundColor(value)))
    }
    func backgroundColor(_ value: Scope.BackgroundColorAttribute.Value) -> Attribute {
        .init(body: .link(self.body, .backgroundColor(value)))
    }
    func kern(_ value: Scope.KernAttribute.Value) -> Attribute {
        .init(body: .link(self.body, .kern(value)))
    }
    func tracking(_ value: Scope.TrackingAttribute.Value) -> Attribute {
        .init(body: .link(self.body, .tracking(value)))
    }
    func baselineOffset(_ value: Scope.BaselineOffsetAttribute.Value) -> Attribute {
        .init(body: .link(self.body, .baselineOffset(value)))
    }
}
