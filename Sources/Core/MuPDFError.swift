//
//  MuPDFError.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/23.
//
import CMuPDF
import Foundation

public enum MuPDFError: Error {
    case generic(message: String?)
    /// fatal out of memory or syscall error
    case system(no: Int32, message: String?)
    /// unclassified error from third-party library
    case library(message: String?)
    /// invalid or out-of-range arguments to functions
    case argument(message: String?)
    /// failed because of resource or other hard limits
    case limit(message: String?)
    /// tried to use an unsupported feature/
    case unsupported(message: String?)
    /// syntax or format errors that are unrecoverable
    case format(message: String?)
    /// syntax errors that should be diagnosed and ignored
    case syntax(message: String?)
    
    public static var generic: Self {
        return .generic(message: nil)
    }
    
    public static var system: Self {
        return .system(no: -1, message: nil)
    }
    
    public static var library: Self {
        return .library(message: nil)
    }
    
    public static var argument: Self {
        return .argument(message: nil)
    }
    
    public static var limit: Self {
        return .limit(message: nil)
    }
    
    public static var unsupported: Self {
        return .unsupported(message: nil)
    }
    
    public static var format: Self {
        return .format(message: nil)
    }
    
    public static var syntax: Self {
        return .syntax(message: nil)
    }
}


extension MuPDFError {
    public typealias RawValue = (type: fz_error_type, message: String?)
    
    public var rawValue: RawValue {
        return switch self {
            case let .generic(message): (FZ_ERROR_GENERIC, message)
            case let .system(no, message): (FZ_ERROR_SYSTEM, message)
            case let .library(message): (FZ_ERROR_LIBRARY, message)
            case let .argument(message): (FZ_ERROR_ARGUMENT, message)
            case let .limit(message): (FZ_ERROR_LIMIT, message)
            case let .unsupported(message): (FZ_ERROR_UNSUPPORTED, message)
            case let .format(message): (FZ_ERROR_FORMAT, message)
            case let .syntax(message): (FZ_ERROR_SYNTAX, message)
        }
    }
    
    public var type: fz_error_type {
        get {
            return rawValue.type
        }
    }
    
    public var code: UInt32 {
        get {
            return rawValue.type.rawValue
        }
    }
    
    public init?(code: Int32, message: String?) {
        guard let error: Self = .init(type: .init(code: code), message: message) else {
            return nil
        }
        self = error
    }
    
    public init?(code: UInt32, message: String?) {
        guard let error: Self = .init(type: .init(code), message: message) else {
            return nil
        }
        self = error
    }
    
    public init?(type: fz_error_type, message: String?) {
        switch type {
            case FZ_ERROR_GENERIC:
                self = .generic(message: message)
            case FZ_ERROR_LIBRARY:
                self = .library(message: message)
            case FZ_ERROR_ARGUMENT:
                self = .argument(message: message)
            case FZ_ERROR_LIMIT:
                self = .limit(message: message)
            case FZ_ERROR_UNSUPPORTED:
                self = .unsupported(message: message)
            case FZ_ERROR_FORMAT:
                self = .format(message: message)
            case FZ_ERROR_SYNTAX:
                self = .syntax(message: message)
            default:
                return nil
        }
    }
    
    public static func ==(lhs: Self, rhs: RawValue) -> Bool {
        return lhs.rawValue == rhs
    }
    
    public static func ==(lhs: RawValue, rhs: Self) -> Bool {
        return lhs == rhs.rawValue
    }
    
    public static func ==(lhs: Self, rhs: fz_error_type) -> Bool {
        return lhs.type == rhs
    }
    
    public static func ==(lhs: fz_error_type, rhs: Self) -> Bool {
        return lhs == rhs.type
    }
}
