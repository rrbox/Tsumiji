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

