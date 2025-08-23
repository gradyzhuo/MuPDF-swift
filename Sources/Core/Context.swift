//
//  Context.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/21.
//
import CMuPDF

extension fz_context: @retroactive @unchecked Sendable {}

public struct Context {
    typealias UnderlyingType = fz_context

    var underlyingPointer: UnsafeMutablePointer<fz_context>
    
    public init(store: Store = .unlimited){
        self.underlyingPointer = fz_new_context_imp(nil, nil, store.rawValue, FZ_VERSION)
    }
    
//    deinit{
//        self.underlyingPointer.deallocate()
//    }
}
