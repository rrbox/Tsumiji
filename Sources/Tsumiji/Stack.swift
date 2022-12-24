//
//  Stack.swift
//  
//
//  Created by rrbox on 2022/12/22.
//

struct Stack {
    var attrributeStack: [Attribute] {
        didSet {
            if self.attrributeStack.count == 0 {
                self.attrributeStack.append([:])
            }
        }
    }
    
    mutating func add(attr: Attribute) throws {
        if let previous = self.attrributeStack.first {
            self.attrributeStack.insert(attr.merging(previous, uniquingKeysWith: { (a, p) in a}), at: 0)
        } else {
            self.attrributeStack.insert(attr, at: 0)
        }
    }
    
    mutating func remove() {
        self.attrributeStack.remove(at: 0)
    }
    
    func getFirst() -> Attribute {
        self.attrributeStack[0]
    }
}

struct ContextStack {
    var attrributeStack: [AttributeContext] {
        didSet {
            if self.attrributeStack.count == 0 {
                self.attrributeStack.append(.init())
            }
        }
    }
    
    mutating func add(attr: AttributeLink) throws {
        if var previous = self.attrributeStack.first {
            attr.modify(&previous)
            self.attrributeStack.insert(previous, at: 0)
        } else {
            self.attrributeStack.insert(attr.createContext(), at: 0)
        }
    }
    
    mutating func remove() {
        self.attrributeStack.remove(at: 0)
    }
    
    func getFirst() -> AttributeContext {
        self.attrributeStack[0]
    }
}
