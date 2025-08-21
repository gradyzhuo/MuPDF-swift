//
//  Context.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/21.
//
import CMuPDF

extension fz_context: @retroactive @unchecked Sendable {}

public struct Context: FZConvertible {
    typealias UnderlyingType = fz_context
    
    var underlyingInstance: fz_context
    
    var unsafePointer: UnsafeMutablePointer<UnderlyingType>{
        get{
            let pointer = UnsafeMutablePointer<UnderlyingType>.allocate(capacity: 1)
            pointer.initialize(to: underlyingInstance)
            return pointer
        }
    }
    
    public init(store: Store = .unlimited){
        self.underlyingInstance = fz_new_context_imp(nil, nil, store.rawValue, FZ_VERSION).pointee
    }
    
    
}
