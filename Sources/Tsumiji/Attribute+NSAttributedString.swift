//
//  Attribute+NSAttributedString.swift
//  
//
//  Created by rrbox on 2022/12/22.
//

import SwiftUI

extension AttributeContext {
    func attribute(_ attrString: inout AttributedString) {
        attrString.mergeAttributes(self.container)
        attrString.font = Scope.FontAttribute.Value(name: self.fontName, size: CGFloat(truncating: self.fontSize))
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
            context.container.foregroundColor = value
        case let .backgroundColor(value):
            context.container.backgroundColor = value
        case let .kern(value):
            context.container.kern = value
        case let .tracking(value):
            context.container.tracking = value
        case let .baselineOffset(value):
            context.container.baselineOffset = value
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
        var result = AttributeContext(container: AttributeContainer())
        self.modify(&result)
        return result
    }
}
