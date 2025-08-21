//
//  Try.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/21.
//
import CMuPDF
import Core
import Darwin

//int sigsetjmp ( Environment,  SaveMask)
func fz_setjmp(buffer: UnsafeMutablePointer<jmp_buf>) -> Int32{
    let rawPointer = UnsafeMutableRawPointer(buffer)
    let pointer = rawPointer.bindMemory(to: Int32.self, capacity: 1)
    // 調用 C 包裝函數
    return wrap_sigsetjmp(pointer, 0)
}

func fz_setjmp(buffer: UnsafeMutablePointer<fz_jmp_buf>) -> Int32{
    let rawPointer = UnsafeMutableRawPointer(buffer)
    let pointer = rawPointer.bindMemory(to: Int32.self, capacity: 1)
    // 調用 C 包裝函數
    return wrap_sigsetjmp(pointer, 0)
}

//#define fz_var(var) fz_var_imp((void *)&(var))
//#define fz_try(ctx) if (!fz_setjmp(*fz_push_try(ctx))) if (fz_do_try(ctx)) do
//#define fz_always(ctx) while (0); if (fz_do_always(ctx)) do
//#define fz_catch(ctx) while (0); if (fz_do_catch(ctx))

func `try`(context: Context){
    fz_do_try(context.unsafePointer)
//    fz_context
    guard let buffer = fz_push_try(context.unsafePointer) else {
        return
    }
    
//    let buffer = bufferPointer?.pointee
    fz_setjmp(buffer: buffer)
//    fz_jmp_buf
    
    
}

    
