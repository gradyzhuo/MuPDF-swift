//
//  FZStore.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/21.
//

import CMuPDF

public struct Store: RawRepresentable {
    public typealias RawValue = Int
    
    public var rawValue: Int
    
    public init?(rawValue: Int) {
        guard rawValue == FZ_STORE_DEFAULT || rawValue == FZ_STORE_UNLIMITED else {
            return nil
        }
        self.rawValue = rawValue
    }
    
    nonisolated(unsafe)
    public static let `default`: Self! = .init(rawValue: FZ_STORE_DEFAULT)
    
    nonisolated(unsafe)
    public static let unlimited: Self! = .init(rawValue: FZ_STORE_UNLIMITED)
    
}

