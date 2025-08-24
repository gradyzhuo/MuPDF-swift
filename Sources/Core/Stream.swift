//
//  Memory.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/23.
//
import Foundation
import CMuPDF
import System

extension fz_stream: @retroactive @unchecked Sendable {}

public struct Stream: FZConvertible {
    package typealias UnderlyingType = fz_stream

    package let pointee: fz_stream
    
    internal init(from pointer: UnsafeMutablePointer<fz_stream>) {
        self.pointee = pointer.pointee
    }

    public init?(data: Data){
        guard let memoryPointer = fz_open_memory(Context.shared.pointer, data.withUnsafeBytes{ $0 }.baseAddress, data.count) else {
            return nil
        }
        self = .init(from: memoryPointer)
    }
    
    public init?(filePath: FilePath){
        guard let pointer = fz_open_file(Context.shared.pointer, filePath.string) else {
            return nil
        }
        self = .init(from: pointer)
    }
    
    public func readAll(initial: Int = 0) -> Buffer? {
        guard let pointer = fz_read_all(Context.shared.pointer, pointer, initial) else {
            return nil
        }
        return .init(from: pointer)
    }
    
//    public func readBest() -> Buffer?{
//        fz_read_
//    }
    
}

