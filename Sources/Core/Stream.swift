//
//  Memory.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/23.
//
import Foundation
import CMuPDF

extension fz_stream: @retroactive @unchecked Sendable {}

public struct Stream {
    internal typealias UnderlyingType = fz_stream

    var underlyingPointer: UnsafeMutablePointer<fz_stream>
    var context: Context
    
    internal init(from pointer: UnsafeMutablePointer<fz_stream>, context: Context) {
        self.underlyingPointer = pointer
        self.context = context
    }

    public init?(data: Data, context: Context){
        guard let memoryPointer = fz_open_memory(context.underlyingPointer, data.withUnsafeBytes{ $0 }.baseAddress, data.count) else {
            return nil
        }
        self = .init(from: memoryPointer, context: context)
    }
    
    public func readAll(initial: Int) -> Buffer? {
        guard let bufferPointer = fz_read_all(context.underlyingPointer, underlyingPointer, initial) else {
            return nil
        }
        return .init(from: bufferPointer, context: context)
    }
    
//    public func readBest() -> Buffer?{
//        fz_read_
//    }
    
}

