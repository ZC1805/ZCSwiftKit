//
//  DictionaryAdditional.swift
//  ZCSwiftKit
//
//  Created by zjy on 2022/12/27.
//

import Foundation

extension Dictionary {
    func isValidJsonKeyString(_ key: String?) -> Bool {
        if let nkey = key, !nkey.isEmpty {
            return true
        }
        return false
    }
    
    func arrayValueFor(_ key: String?) -> [Any?] {
        var aimValue: [Any?] = []
        if isValidJsonKeyString(key) {
            let obj = self[(key as! Key)]
            if let xobj = obj as? [Any?] {
                aimValue = xobj
            }
        }
        return aimValue
    }
    
    func dictionaryValueFor(_ key: String?) -> [Key : Value?] {
        var aimValue: [Key : Value?] = [:]
        if isValidJsonKeyString(key) {
            let obj = self[(key as! Key)]
            if let xobj = obj as? [Key : Value?] {
                aimValue = xobj
            }
        }
        return aimValue
    }
    
    func stringValueFor(_ key: String?, defaultValue: String = "") -> String { //异常做四舍五入处理
        var aimValue: String = defaultValue
        if isValidJsonKeyString(key) {
            let obj = self[(key as! Key)]
            if let xobj = obj as? String {
                aimValue = Global.isNull(xobj) ? defaultValue : xobj
            }
            else if let xobj = obj as? Bool {
                aimValue = xobj ? "1" : "0"
            }
            else if let xobj = obj as? Int {
                aimValue = String(xobj)
            }
            else if let xobj = obj as? (any FixedWidthInteger & SignedInteger) {
                aimValue = String(xobj)
            }
            else if let xobj = obj as? (any FixedWidthInteger & UnsignedInteger) {
                aimValue = String(xobj)
            }
            else if let xobj = obj as? Double {
                aimValue = xobj.stringRound(abnormalResult: defaultValue)
            }
            else if let xobj = obj as? Float {
                aimValue = xobj.stringRound(abnormalResult: defaultValue)
            }
            else if let xobj = obj as? Character {
                aimValue = String(xobj)
            }
            else if let xobj = obj as? Substring {
                aimValue = Global.isNull(xobj) ? defaultValue : String(xobj)
            }
            else if let xobj = obj as? NSNumber {
                aimValue = xobj.stringRound(abnormalResult: defaultValue)
            }
            else if let xobj = obj as? NSAttributedString {
                aimValue = Global.isNull(xobj) ? defaultValue : xobj.string
            }
        }
        return aimValue
    }
    
    func intValueFor(_ key: String?, defaultValue: Int = 0) -> Int { //异常做截取整数处理
        var aimValue: Int = defaultValue
        if isValidJsonKeyString(key) {
            let obj = self[(key as! Key)]
            if let xobj = obj as? Int {
                aimValue = xobj
            }
            else if let xobj = obj as? (any FixedWidthInteger & SignedInteger) {
                aimValue = xobj.intConvert(abnormalResult: defaultValue)
            }
            else if let xobj = obj as? (any FixedWidthInteger & UnsignedInteger) {
                aimValue = xobj.intConvert(abnormalResult: defaultValue)
            }
            else if let xobj = obj as? Bool {
                aimValue = xobj ? 1 : 0
            }
            else if let xobj = obj as? Double {
                aimValue = xobj.intRound(abnormalResult: defaultValue, isUseRound: false)
            }
            else if let xobj = obj as? Float {
                aimValue = xobj.intRound(abnormalResult: defaultValue, isUseRound: false)
            }
            else if let xobj = obj as? String {
                aimValue = xobj.intRound(abnormalResult: defaultValue, isUseRound: false)
            }
            else if let xobj = obj as? Character {
                aimValue = String(xobj).intRound(abnormalResult: defaultValue, isUseRound: false)
            }
            else if let xobj = obj as? Substring {
                aimValue = String(xobj).intRound(abnormalResult: defaultValue, isUseRound: false)
            }
            else if let xobj = obj as? NSNumber {
                aimValue = xobj.intRound(abnormalResult: defaultValue, isUseRound: false)
            }
            else if let xobj = obj as? NSAttributedString {
                aimValue = xobj.string.intRound(abnormalResult: defaultValue, isUseRound: false)
            }
        }
        return aimValue
    }
    
    func doubleValueFor(_ key: String?, defaultValue: Double = 0) -> Double { //异常暂不做处理
        var aimValue: Double = defaultValue
        if isValidJsonKeyString(key) {
            let obj = self[(key as! Key)]
            if let xobj = obj as? Double {
                aimValue = xobj
            }
            else if let xobj = obj as? Float {
                aimValue = Double(xobj)
            }
            else if let xobj = obj as? Bool {
                aimValue = xobj ? 1.0 : 0.0
            }
            else if let xobj = obj as? Int {
                aimValue = Double(xobj)
            }
            else if let xobj = obj as? (any FixedWidthInteger & SignedInteger) {
                aimValue = Double(xobj)
            }
            else if let xobj = obj as? (any FixedWidthInteger & UnsignedInteger) {
                aimValue = Double(xobj)
            }
            else if let xobj = obj as? String {
                aimValue = Double(xobj) ?? defaultValue
            }
            else if let xobj = obj as? Character {
                aimValue = Double(String(xobj)) ?? defaultValue
            }
            else if let xobj = obj as? Substring {
                aimValue = Double(String(xobj)) ?? defaultValue
            }
            else if let xobj = obj as? NSNumber {
                aimValue = (xobj as? Double) ?? defaultValue
            }
            else if let xobj = obj as? NSAttributedString {
                aimValue = Double(xobj.string) ?? defaultValue
            }
        }
        if (aimValue.isInfinite || aimValue.isNaN) && !aimValue.isEqual(to: defaultValue) {
            aimValue = defaultValue
        }
        return aimValue
    }
    
    func boolValueFor(_ key: String?, defaultValue: Bool = false) -> Bool { //异常做截取整数处理
        var aimValue: Bool = defaultValue
        if isValidJsonKeyString(key) {
            let obj = self[(key as! Key)]
            if let xobj = obj as? Bool {
                aimValue = xobj
            }
            else if let xobj = obj as? Int {
                aimValue = xobj != 0 ? true : false
            }
            else if let xobj = obj as? (any FixedWidthInteger & SignedInteger) {
                aimValue = xobj.intConvert(abnormalResult: defaultValue ? 1 : 0) != 0 ? true : false
            }
            else if let xobj = obj as? (any FixedWidthInteger & UnsignedInteger) {
                aimValue = xobj.intConvert(abnormalResult: defaultValue ? 1 : 0) != 0 ? true : false
            }
            else if let xobj = obj as? Double {
                aimValue = xobj.intRound(abnormalResult: defaultValue ? 1 : 0, isUseRound: false) != 0 ? true : false
            }
            else if let xobj = obj as? Float {
                aimValue = xobj.intRound(abnormalResult: defaultValue ? 1 : 0, isUseRound: false) != 0 ? true : false
            }
            else if let xobj = obj as? String {
                if xobj == "true" || xobj == "TRUE" || xobj == "yes" || xobj == "YES" || xobj == "1" || xobj == "y" || xobj == "Y" {
                    aimValue = true
                }
                else if xobj == "false" || xobj == "FALSE" || xobj == "no" || xobj == "NO" || xobj == "0" || xobj == "n" || xobj == "N" {
                    aimValue = false
                }
                else {
                    aimValue = xobj.intRound(abnormalResult: defaultValue ? 1 : 0, isUseRound: false) != 0 ? true : false
                }
            }
            else if let xobj = obj as? Character {
                aimValue = String(xobj).intRound(abnormalResult: defaultValue ? 1 : 0, isUseRound: false) != 0 ? true : false
            }
            else if let xobj = obj as? Substring {
                aimValue = String(xobj).intRound(abnormalResult: defaultValue ? 1 : 0, isUseRound: false) != 0 ? true : false
            }
            else if let xobj = obj as? NSNumber {
                aimValue = xobj.intRound(abnormalResult: defaultValue ? 1 : 0, isUseRound: false) != 0 ? true : false
            }
            else if let xobj = obj as? NSAttributedString {
                aimValue = xobj.string.intRound(abnormalResult: defaultValue ? 1 : 0, isUseRound: false) != 0 ? true : false
            }
        }
        return aimValue
    }
}



extension Dictionary {
    static func valid(_ any: Any?) -> [Key : Value?] {
        var aimValue: [Key : Value?] = [:]
        if let xobj = any as? [Key : Value?] {
            aimValue = xobj
        }
        return aimValue
    }
    
    func subDictionaryFor(keys: [Key]?) -> [Key : Value?] {
        var dic: [Key : Value?] = [:]
        for key in (keys ?? []) {
            let obj = self[key]
            if let xobj = obj {
                dic[key] = xobj
            }
        }
        return dic
    }
    
    func isContainValueFor(key: Key?, isAllowNull: Bool = false) -> Bool {
        if let nkey = key {
            let obj = self[nkey]
            if isAllowNull {
                if let _ = obj {
                    return true
                }
            } else {
                return Global.isNull(obj, isNotCheckNumber: true) ? false : true
            }
        }
        return false
    }
    
    func jsonString(abnormalResult: String = "", isFormat: Bool = false) -> String {
        var aimStr = abnormalResult
        if JSONSerialization.isValidJSONObject(self) {
            var ops: JSONSerialization.WritingOptions = JSONSerialization.WritingOptions(rawValue: 0)
            if isFormat { ops = .prettyPrinted }
            if let data = try? JSONSerialization.data(withJSONObject: self, options: ops) {
                aimStr = String(data: data, encoding: .utf8) ?? abnormalResult
            }
        }
        return aimStr
    }
}
