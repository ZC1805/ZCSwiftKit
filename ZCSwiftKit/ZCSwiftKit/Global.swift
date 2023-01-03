//
//  Global.swift
//  ZCSwiftKit
//
//  Created by zjy on 2022/12/30.
//

import Foundation

class Global {
    class func isNull(_ value: Any?, isNotCheckNumber: Bool = false) -> Bool {
        if let _ = value as? NSNull {
            return true
        }
        else if let xobj = value as? String {
            return (xobj == "<null>" || xobj == "(null)" || xobj == "null" || xobj == "NULL" || xobj == "<nil>") ? true : false
        }
        else if let xobj = value as? Substring {
            return (xobj == "<null>" || xobj == "(null)" || xobj == "null" || xobj == "NULL" || xobj == "<nil>") ? true : false
        }
        else if let xobj = value as? Double, !isNotCheckNumber {
            return (xobj.isInfinite || xobj.isNaN) ? true : false
        }
        else if let xobj = value as? Float, !isNotCheckNumber {
            return (xobj.isInfinite || xobj.isNaN) ? true : false
        }
        else if let xobj = value as? NSNumber, !isNotCheckNumber {
            return (xobj.doubleValue.isInfinite || xobj.doubleValue.isNaN) ? true : false
        }
        else if let aobj = value as? NSAttributedString {
            let xobj = aobj.string
            return (xobj == "<null>" || xobj == "(null)" || xobj == "null" || xobj == "NULL" || xobj == "<nil>") ? true : false
        }
        else if let xobj = value as Any? {
            if case Optional<Any>.none = xobj {
                return true
            } else {
                return false
            }
        }
        return true
    }
}
