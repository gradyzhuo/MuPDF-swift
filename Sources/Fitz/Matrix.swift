//
//  Matrix.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/20.
//

import CMuPDF
import Accelerate



/**
 Matrix() - all zeros
 Matrix(a, b, c, d, e, f)
 Matrix(zoom-x, zoom-y) - zoom
 Matrix(shear-x, shear-y, 1) - shear
 Matrix(degree) - rotate
 Matrix(Matrix) - new copy
 Matrix(sequence) - from 'sequence'
 Matrix(mupdf.FzMatrix) - from MuPDF class wrapper for fz_matrix.

 Explicit keyword args a, b, c, d, e, f override any earlier settings if
 not None.
 */
public struct Matrix: FZConvertible {
    internal typealias UnderlyingType = fz_matrix
        
    internal private(set) var underlyingPointer: UnsafeMutablePointer<fz_matrix>
    
    public init(a: Float, b: Float, c: Float, d: Float, e: Float, f: Float){
        self.underlyingPointer = .with{
            .init(a: a, b: b, c: c, d: d, e: e, f: f)
        }
        self.underlyingPointer = .with(pointee: .init(a: a, b: b, c: c, d: d, e: e, f: f))
    }
    
    public init(){
        self.init(0, 0, 0, 0, 0, 0)
    }
    
    public init(_ a: Float, _ b: Float, _ c: Float, _ d: Float, _ e: Float, _ f: Float){
        self.init(a: a, b: b, c: c, d: d, e: e, f: f)
    }
    
    public init(zoomX: Float, zoomY: Float){
        self.init(a: zoomX, b: 0, c: 0, d: zoomY, e: 0, f: 0)
    }
    
    public init(shearX: Float, shearY: Float){
        self.init(a: 1, b: shearX, c: shearY, d: 1, e: 0, f: 0)
    }
    
    public mutating func rotate(degree: Float){
        
    }
    
    
}
