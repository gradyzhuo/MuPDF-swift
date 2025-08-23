//
//  UnsafeMutablePointer+Additions.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/22.
//


extension UnsafeMutablePointer {
    package static func with(constructor: ()->Pointee) -> Self {
        var pointer = Self.allocate(capacity: 1)
        let pointee = constructor()
        pointer.initialize(to: pointee)
        return pointer
    }
    
    package static func with(pointee constructor: @autoclosure @escaping () -> Pointee) -> Self {
        return with(constructor: constructor)
    }
}
