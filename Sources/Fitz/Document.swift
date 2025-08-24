//
//  Document.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/23.
//
import CMuPDF
import Core
import System

extension fz_document: @retroactive @unchecked Sendable {}

public struct Document: FZConvertible {
    package typealias UnderlyingType = fz_document
    
    package let pointee: fz_document
    
    private init(_ pointer: UnsafeMutablePointer<fz_document>) {
        self.pointee = pointer.pointee
    }
    
    public init?(stream: Stream, filename: String){
        self = .init(fz_open_document_with_stream(Context.shared.pointer, filename, stream.pointer))
    }
    
//    public init(filePath: FilePath, context: Context = .init()){
//        let stream = Stream(filePath: filePath, context: context)
//        
////        let stream = fz_open_file(context.underlyingPointer, filename)
//        
//    }
    
//    public init(buffer: Buffer, context: Context = .init()){
////        fz_open_buffer(context.underlyingPointer, buffer.underlyingPointer)
////        fz_open_fil
//    }
    
//    
//    deinit{
//        self.underlyingPointer.deallocate()
//    }
}
