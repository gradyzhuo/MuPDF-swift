//
//  FZStore.swift
//  MuPDF
//
//  Created by Grady Zhuo on 2025/8/21.
//
import Core
import CMuPDF
import Logging

public enum Store {
    case `default`
    case unlimited
}

extension Store: RawRepresentable {
    public typealias RawValue = Int
    
    public var rawValue: Int {
        return switch self {
        case .default: FZ_STORE_DEFAULT
        case .unlimited: FZ_STORE_UNLIMITED
        }
    }
    
    public init?(rawValue: Int) {
        switch rawValue {
        case FZ_STORE_DEFAULT:
            self = .default
        case FZ_STORE_UNLIMITED:
            self = .unlimited
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
}

extension Store: CustomStringConvertible {
    private var cName: String {
        return switch self {
            case .default: "FZ_STORE_DEFAULT"
            case .unlimited: "FZ_STORE_UNLIMITED"
        }
    }
    
    private var name: String {
        return switch self {
            case .default: "default"
        case .unlimited: "unlimited"
        }
    }
    
    public var description: String {
        return "Store.\(name) [underlying: \(cName)(\(rawValue))]"
    }
}
