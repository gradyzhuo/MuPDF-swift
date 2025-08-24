//
//  Context.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/21.
//
import CMuPDF

extension fz_context: @retroactive @unchecked Sendable {}

public struct Context: FZConvertible{
    package typealias UnderlyingType = fz_context

    package let pointee: fz_context
    
    public static let shared: Context = Context()
    
    internal init(from pointer: UnsafeMutablePointer<fz_context>){
        self.pointee = pointer.pointee
    }
    
    package init(store: Store = .unlimited){
        self.init(from: fz_new_context_imp(nil, nil, store.rawValue, FZ_VERSION))
    }
}

