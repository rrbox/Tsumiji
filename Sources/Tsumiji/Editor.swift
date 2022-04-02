//
//  Builder.swift
//  
//
//  Created by rrbox on 2022/02/09.
//

import Foundation

final public class Editor: NSObject {
    
    public let product = NSMutableAttributedString()
    
    var stack = Stack(attrributeStack: [[:]])
    
    public override init() {}
    
    @discardableResult public func text(_ value: String) -> Self {
        self.product.append(NSAttributedString(string: value, attributes: self.stack.getFirst().toNSAttribute()))
        return self
    }
    
    @discardableResult public func font(_ value: Attribute) -> Self {
        try! self.stack.add(attr: value)
        return self
    }
    
    @discardableResult public func fontEnd() -> Self {
        self.stack.remove()
        return self
    }
    
}
