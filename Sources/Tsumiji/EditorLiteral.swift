//
//  File.swift
//  
//
//  Created by rrbox on 2022/04/02.
//

import Foundation

public enum Command {
    case fontEnd
}

public struct EditorInterpolation: StringInterpolationProtocol {
    
    var product: AttributedString
    
    var stack = ContextStack()
    
    public init(literalCapacity: Int, interpolationCount: Int) {
        self.product = AttributedString()
    }
    
    mutating public func appendLiteral(_ literal: String) {
        var arrtibutedText = AttributedString(literal)
        self.stack.getFirst().attribute(&arrtibutedText)
        self.product += arrtibutedText
    }
    
    mutating public func appendInterpolation(_ font: AttributeLink) {
        self.stack.add(attr: font)
    }
    
    mutating public func appendInterpolation(_ command: Command) {
        self.stack.remove()
    }
    
}


public struct EditorLiteral: ExpressibleByStringLiteral, ExpressibleByStringInterpolation {
    
    public var product: AttributedString
    
    public init(stringLiteral value: String) {
        self.product = AttributedString(value)
        ContextStack().getFirst().attribute(&self.product)
    }

    public init(stringInterpolation: EditorInterpolation) {
        self.product = stringInterpolation.product
    }

}
