//
//  Document.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/23.
//
import CMuPDF
import Core

extension fz_document: @retroactive @unchecked Sendable {}

public struct Document: FZConvertible, ~Copyable {
    internal typealias UnderlyingType = fz_document
    
    let context: Context
    let underlyingPointer: UnsafeMutablePointer<fz_document>
    
    public init() {
        self.context = .init()
//        fz_open_memory(context.underlyingPointer, <#T##data: UnsafePointer<UInt8>!##UnsafePointer<UInt8>!#>, <#T##len: Int##Int#>)
////        fz_new_document_of_size(/*<#T##ctx: UnsafeMutablePointer<fz_context>!##UnsafeMutablePointer<fz_context>!#>*/, <#T##size: Int32##Int32#>)
        self.underlyingPointer = .with(pointee: .init())
    }
    
    
    
    deinit{
        self.underlyingPointer.deallocate()
    }
}
