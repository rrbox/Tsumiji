//
//  Builder.swift
//  
//
//  Created by rrbox on 2022/02/09.
//

import Foundation

public struct Editor {
    
    public var product = AttributedString()
    
    var stack = ContextStack()
    
    public init() {}
    
    public func text(_ value: String) -> Self {
        var result = self
        var attributedText = AttributedString(value)
        self.stack.getFirst().attribute(&attributedText)
        result.product += attributedText
        return result
    }
    
    public func font(_ value: Attribute) -> Self {
        var result = self
        result.stack.add(attr: value)
        return result
    }
    
    public func fontEnd() -> Self {
        var result = self
        result.stack.remove()
        return result
    }
    
}
