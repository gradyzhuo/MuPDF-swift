//
//  fz_context.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/23.
//
import CMuPDF

package func fz_new_context(store: Store) -> UnsafeMutablePointer<fz_context>{
    return fz_new_context_imp(nil, nil, store.rawValue, FZ_VERSION)
}
