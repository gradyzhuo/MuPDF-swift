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
func fz_setjmp() -> Int32{
    // 分配一個 jmp_buf
    let pointer = UnsafeMutableBufferPointer<Int32>.allocate(capacity: 49)
    defer { pointer.deallocate() } // 確保記憶體釋放
    
    // 初始化 jmp_buf（通常不需要顯式初始化，因為 sigsetjmp 會填充它）
    pointer.initialize(repeating: 0)
    
    // 調用 C 包裝函數
    return wrap_sigsetjmp(pointer.baseAddress, 0)
}

func `try`(context: Context){
    fz_do_try(context.unsafePointer)
}

    
