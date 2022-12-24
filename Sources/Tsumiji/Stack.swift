//
//  Stack.swift
//  
//
//  Created by rrbox on 2022/12/22.
//

struct ContextStack {
    var attrributeStack: [AttributeContext] {
        didSet {
            if self.attrributeStack.count == 0 {
                self.attrributeStack.append(.init())
            }
        }
    }
    
    mutating func add(attr: AttributeLink) {
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
    
    init() {
        self.attrributeStack = [AttributeContext()]
    }
}
