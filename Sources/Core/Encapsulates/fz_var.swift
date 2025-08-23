//
//  fz_var.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/24.
//

import CMuPDF

public func fz_var<Pointee>(_ pointer: UnsafeMutablePointer<Pointee>) {
    fz_var_imp(.init(AutoreleasingUnsafeMutablePointer<Pointee>(pointer)))
}
