//
//  FZObjectConvertible.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/20.
//
import Core

package protocol FZConvertible: Sendable {
    associatedtype UnderlyingType
    
    var pointee: UnderlyingType { get }
}

extension FZConvertible {
    package var pointer: UnsafeMutablePointer<UnderlyingType> {
        get{
            return .with(pointee: pointee)
        }
    }
}
