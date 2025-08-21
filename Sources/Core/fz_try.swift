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

    
