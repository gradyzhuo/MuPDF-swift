//
//  setjmp_wrapper.c
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/21.
//

#include <setjmp.h>

int wrap_sigsetjmp(sigjmp_buf env, int savesigs) {
    return sigsetjmp(env, savesigs);
}
