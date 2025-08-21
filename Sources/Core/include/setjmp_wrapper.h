//
//  setjmp_wrapper.h
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/21.
//

#ifndef SETJMP_WRAPPER_H
#define SETJMP_WRAPPER_H

#include <setjmp.h>

int wrap_sigsetjmp(jmp_buf env, int savesigs);

#endif
