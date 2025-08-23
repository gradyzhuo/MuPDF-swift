//
//  Buffer.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/23.
//

import CMuPDF

public struct Buffer {
    typealias UnderlyingType = fz_buffer
    
    let underlyingPointer: UnsafeMutablePointer<fz_buffer>
    let context: Context
    
    
    init(from pointer: UnsafeMutablePointer<fz_buffer>, context: Context) {
        self.underlyingPointer = pointer
        self.context = context
    }
    
    init?(capacity: Int, context: Context){
        guard let pointer = fz_new_buffer(context.underlyingPointer, capacity) else{
            return nil
        }
        self = .init(from: pointer, context: context)
    }

    public init?(fileName: String, context: Context) throws {
        guard let pointer = fz_read_file(context.underlyingPointer, fileName) else {
            do{
                try fz_catch(context: context.underlyingPointer)
            }catch{
                throw error
            }
            return nil
        }
        self = .init(from: pointer, context: context)
        
    }
    
    
    
}
