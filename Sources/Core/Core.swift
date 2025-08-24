//
//  Core.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/23.
//
import CMuPDF
import Logging
import Foundation

package let logger = Logger(label: "[MuPDF]")


package func `try`(context: borrowing Context, handler: () throws -> Void) throws {

    guard let buffer = fz_push_try(context.pointer) else {
        return
    }
    
    guard fz_setjmp(buffer: buffer) == 0 else {
        return
    }
    
    guard fz_do_try(context.pointer) > 0 else {
        return
    }
    
    try handler()
}

public struct Try {
    
    internal private(set) var doHandler: () throws ->Void
    internal private(set) var alwaysHandler: (()->Void)?
    internal private(set) var catchHandler: ((_ errorCode: Int32, _ errorNo: Int32, _ message: String?) throws -> Void)?
    
    internal init(_ handler: @escaping () throws ->Void){
        self.doHandler = handler
    }
    
    public static func `do`(_ handler: @escaping ()->Void) -> Self{
        return .init(handler)
    }
    
    public func always(_ handler: @escaping ()->Void)-> Self{
        var copiedSelf = self
        copiedSelf.alwaysHandler = handler
        return copiedSelf
    }
    
    public func `catch`(_ handler: @escaping (_ errorCode: Int32, _ errorNo: Int32, _ message: String?) throws -> Void)->Self{
        var copiedSelf = self
        copiedSelf.catchHandler = handler
        return copiedSelf
    }
}

public func withContext<R>(_ context: borrowing Context, try processor: @escaping () throws -> R, always: (() -> Void)? = nil ) throws -> R{
    
    try fz_try(context: context.pointer)
    
    let result = try processor()
    if let always {
        try fz_always(context: context.pointer, handler: always)
    }
    try fz_catch(context: context.pointer)
    
    return result
}
