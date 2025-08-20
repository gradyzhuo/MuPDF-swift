//
//  Page.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/20.
//
import CMuPDF

extension fz_page: @retroactive @unchecked Sendable {}

public struct Page: FZConvertible {
    internal typealias UnderlyingType = fz_page
    
    let underlyingInstance: fz_page
    
    public init() {
        self.underlyingInstance = .init()
    }
}
