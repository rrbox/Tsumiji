//
//  Attribute+NSAttributedString.swift
//  
//
//  Created by rrbox on 2022/12/22.
//

import SwiftUI

extension AttributeContext {
    func attribute(_ attrString: inout AttributedString) {
        attrString.foregroundColor = self.foregroundColor
        attrString.font = Scope.FontAttribute.Value(name: self.fontName, size: CGFloat(truncating: self.fontSize))
        attrString.backgroundColor = self.backgroundColor
        attrString.kern = self.kern
    }
}

extension AttributeElement {
    func modify(_ context: inout AttributeContext) {
        switch self {
        case let .fontName(value):
            context.fontName = value
        case let .fontSize(value):
            context.fontSize = value
        case let .foregroundColor(value):
            context.foregroundColor = value
        case let .backgroundColor(value):
            context.backgroundColor = value
        case let .kern(value):
            context.kern = value
        }
    }
}

extension AttributeLink {
    func modify(_ context: inout AttributeContext) {
        switch self {
        case let .single(element):
            element.modify(&context)
        case let .link(previous, element):
            previous.modify(&context)
            element.modify(&context)
        }
    }
    
    func createContext() -> AttributeContext {
        var result = AttributeContext()
        self.modify(&result)
        return result
    }
}
