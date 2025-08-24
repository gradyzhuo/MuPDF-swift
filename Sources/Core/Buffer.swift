//
//  Buffer.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/23.
//

import CMuPDF
import System

extension fz_buffer: @retroactive @unchecked Sendable {}

public struct Buffer: FZConvertible {
    package typealias UnderlyingType = fz_buffer
    
    package let pointee: fz_buffer
    
    init(from pointer: UnsafeMutablePointer<fz_buffer>) {
        self.pointee = pointer.pointee
    }
    
    public init?(capacity: Int){
        guard let pointer = fz_new_buffer(Context.shared.pointer, capacity) else{
            return nil
        }
        self = .init(from: pointer)
    }

    public init?(filePath: FilePath) throws {
        guard let pointer = fz_read_file(Context.shared.pointer, filePath.withCString(\.self)) else {
            do{
                try fz_catch(context: Context.shared.pointer)
            }catch{
                throw error
            }
            return nil
        }
        self = .init(from: pointer)
    }
    
    
    
}
