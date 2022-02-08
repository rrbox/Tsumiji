//
//  Builder.swift
//  
//
//  Created by rrbox on 2022/02/09.
//

import Foundation

public struct Tag {
    var attribute: Attribute
    public init(attribute: Attribute) {
        self.attribute = attribute
    }
}

final public class Builder: NSObject {
    
    public let product = NSMutableAttributedString()
    
    var stack = Stack(attrributeStack: [])
    
    public override init() {}
    
    @discardableResult public func text(_ value: String) -> Self {
        self.product.append(NSAttributedString(string: value, attributes: self.stack.getFirst().toNSAttribute()))
        return self
    }
    
    @discardableResult public func tag(_ value: Tag) -> Self {
        try! self.stack.add(attr: value.attribute)
        return self
    }
    
    @discardableResult public func tagEnd() -> Self {
        self.stack.remove()
        return self
    }
    
}
