//
//  FZObjectConvertible.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/20.
//

internal protocol FZConvertible: Sendable {
    associatedtype UnderlyingType
    
    var underlyingInstance: UnderlyingType { get }
}
