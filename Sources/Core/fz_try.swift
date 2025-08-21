//
//  Try.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/21.
//
import CMuPDF

//#define fz_var(var) fz_var_imp((void *)&(var))
//#define fz_try(ctx) if (!fz_setjmp(*fz_push_try(ctx))) if (fz_do_try(ctx)) do
//#define fz_always(ctx) while (0); if (fz_do_always(ctx)) do
//#define fz_catch(ctx) while (0); if (fz_do_catch(ctx))

func fz_try(context: UnsafeMutablePointer<fz_context>, handler: () throws -> Void) throws {

    guard let buffer = fz_push_try(context) else {
        return
    }
    
    guard fz_setjmp(buffer: buffer) == 0 else {
        return
    }
    
    guard fz_do_try(context) > 0 else {
        return
    }
    
    try handler()
}

func fz_always(context: UnsafeMutablePointer<fz_context>, handler: () throws -> Void) throws {

    guard fz_do_always(context) > 0 else {
        return
    }
    
    try handler()
}

func fz_catch(context: UnsafeMutablePointer<fz_context>, handler: (_ errorCode: Int32, _ errorNo: Int32, _ message: UnsafePointer<CChar>?) throws -> Void) throws {

    guard fz_do_catch(context) > 0 else {
        return
    }
    
    let errorCode = fz_caught(context)
    let errorNo = fz_caught_errno(context)
    let errorMessage = fz_caught_message(context).map{
        String(cString: $0)
    }
    
    try handler(errorCode, errorNo, errorMessage)
}

    
