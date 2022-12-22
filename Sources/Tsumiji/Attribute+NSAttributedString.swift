//
//  Attribute+NSAttributedString.swift
//  
//
//  Created by rrbox on 2022/12/22.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import Cocoa
#endif

extension Attribute {
    
    func toNSAttribute() -> [NSAttributedString.Key:Any] {
        return [
            .font: Font(name: self[.fontName] as? String ?? "HelveticaNeue-UltraLight", size: CGFloat(truncating: self[.fontSize] as? NSNumber ?? NSNumber(value: 32))) ?? Font(),
            .foregroundColor:self[.fontColor] ?? Color.white,
            .backgroundColor:self[.backgroundColor] ?? Color.clear
        ]
    }
    
}

