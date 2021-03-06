//
//  Builder.swift
//  
//
//  Created by rrbox on 2022/02/09.
//

import Foundation

public struct Editor {
    
    public var product = AttributedString()
    
    var stack = Stack(attrributeStack: [[:]])
    
    public init() {}
    
    public init(_ nsAttributedString: NSAttributedString) {
        self.product = AttributedString(nsAttributedString)
    }
    
    @discardableResult public func text(_ value: String) -> Self {
        var result = self
        result.product.append(AttributedString(NSAttributedString(string: value, attributes: self.stack.getFirst().toNSAttribute())))
        return result
    }
    
    @discardableResult public func font(_ value: Attribute) -> Self {
        var result = self
        try! result.stack.add(attr: value)
        return result
    }
    
    @discardableResult public func fontEnd() -> Self {
        var result = self
        result.stack.remove()
        return result
    }
    
}
