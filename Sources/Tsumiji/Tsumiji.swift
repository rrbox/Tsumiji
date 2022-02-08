//
//  Tsumiji.swift
//
//
//  Created by rrbox on 2022/02/09.
//

import Foundation
#if os(iOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif

#if os(iOS)
typealias Font = UIFont
typealias Color = UIColor
#elseif os(macOS)
typealias Font = NSFont
typealias Color = NSColor
#endif

public enum AttributeKey {
    case fontName, fontSize, fontColor, backgroundColor
}

public typealias Attribute = [AttributeKey: Any]

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

extension Attribute {
    
    func toNSAttribute() -> [NSAttributedString.Key:Any] {
        return [
            .font: Font(name: self[.fontName] as? String ?? "HelveticaNeue-UltraLight", size: CGFloat(truncating: self[.fontSize] as? NSNumber ?? NSNumber(value: 32))) ?? Font(),
            .foregroundColor:self[.fontColor] ?? Color.white,
            .backgroundColor:self[.backgroundColor] ?? Color.clear
        ]
    }
    
}

