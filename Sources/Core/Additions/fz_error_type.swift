//
//  fz_error_type.swift
//  MuPDF-Swift
//
//  Created by Grady Zhuo on 2025/8/24.
//
import CMuPDF

extension fz_error_type {
    public init(code: Int32){
        self.init(UInt32(code))
    }
    
    public static func ==(lhs: Self, rhs: RawValue) -> Bool{
        return lhs.rawValue == rhs
    }
    
    public static func ==(lhs: RawValue, rhs: Self) -> Bool{
        return lhs == rhs.rawValue
    }
    
    public static func ==(lhs: Self, rhs: Int32) -> Bool{
        return lhs.rawValue == rhs
    }
    
    public static func ==(lhs: Int32, rhs: Self) -> Bool{
        return lhs == rhs.rawValue
    }
    
}
