//
//  fz_setjmp.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/21.
//
import CCore
import CMuPDF

package func fz_setjmp(buffer: UnsafeMutablePointer<jmp_buf>) -> Int32{
    let rawPointer = UnsafeMutableRawPointer(buffer)
    let pointer = rawPointer.bindMemory(to: Int32.self, capacity: 1)
    // 調用 C 包裝函數
    return wrap_sigsetjmp(pointer, 0)
}

package func fz_setjmp(buffer: UnsafeMutablePointer<fz_jmp_buf>) -> Int32{
    let rawPointer = UnsafeMutableRawPointer(buffer)
    let pointer = rawPointer.bindMemory(to: Int32.self, capacity: 1)
    // 調用 C 包裝函數
    return wrap_sigsetjmp(pointer, 0)
}
