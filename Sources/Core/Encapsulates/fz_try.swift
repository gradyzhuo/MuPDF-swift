//
//  Try.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/21.
//
import CMuPDF

package func fz_try(context: UnsafeMutablePointer<fz_context>){

    guard let buffer = fz_push_try(context) else {
        return
    }
    
    guard fz_setjmp(buffer: buffer) == 0 else {
        return
    }
    
    guard fz_do_try(context) > 0 else {
        return
    }
}

func fz_always(context: UnsafeMutablePointer<fz_context>, handler: () throws -> Void) throws {

    guard fz_do_always(context) > 0 else {
        return
    }
    
    try handler()
}

func fz_catch(context: UnsafeMutablePointer<fz_context>) throws(MuPDFError) {
    guard fz_do_catch(context) > 0 else {
        return
    }
    
    let code = fz_caught(context)
    let message = fz_convert_error(context, .with(pointee: code)).map{
        String(cString: $0)
    }
    
    let error: MuPDFError? = if code == MuPDFError.system.code {
        .system(no: fz_caught_errno(context), message: message)
    }else{
        .init(code: code, message: message)
    }
    
    guard let error else {
        return
    }
    
    throw error
    
}

    
