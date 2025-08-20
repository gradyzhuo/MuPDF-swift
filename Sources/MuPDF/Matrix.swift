//
//  Matrix.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/20.
//

import CMuPDF

public struct Matrix: FZConvertible {
    internal typealias UnderlyingType = fz_matrix
        
    let underlyingInstance: fz_matrix
    
    public init(){
        self.underlyingInstance = .init()
    }
}
