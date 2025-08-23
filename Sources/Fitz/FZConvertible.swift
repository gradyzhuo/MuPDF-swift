//
//  FZObjectConvertible.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/20.
//

internal protocol FZConvertible: ~Copyable {
    associatedtype UnderlyingType
    
    var underlyingPointer: UnsafeMutablePointer<UnderlyingType> { get }
}
