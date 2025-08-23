//
//  Page.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/20.
//
import CMuPDF
import Core

extension fz_page: @retroactive @unchecked Sendable {}

public struct Page: FZConvertible, ~Copyable {
    internal typealias UnderlyingType = fz_page
    
    let underlyingPointer: UnsafeMutablePointer<fz_page>
    
    public init() {
        self.underlyingPointer = .with(pointee: .init())
    }
    
    deinit{
        self.underlyingPointer.deallocate()
    }
}


