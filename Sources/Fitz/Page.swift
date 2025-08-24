//
//  Page.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/20.
//
import CMuPDF
import Core

extension fz_page: @retroactive @unchecked Sendable {}

public struct Page: FZConvertible {
    package typealias UnderlyingType = fz_page
    
    package let pointee: fz_page
    
    public init(from pointer: UnsafeMutablePointer<fz_page>) {
        self.pointee = pointer.pointee
    }
    
    public init(size: Int32, document: Document){
        self.init(from: fz_new_page_of_size(Context.shared.pointer, size, document.pointer))
    }
    
}


