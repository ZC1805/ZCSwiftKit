//
//  ArrayAdditional.swift
//  ZCSwiftKit
//
//  Created by zjy on 2022/12/27.
//

import Foundation

extension Array {
    func isValidJsonIndexInt(_ index: Int?) -> Bool {
        if let nindex = index, nindex >= 0, nindex < self.count {
            return true
        }
        return false
    }
    
    func arrayItemFor(_ index: Int?) -> [Any?] {
        var aimItem: [Any?] = []
        if isValidJsonIndexInt(index) {
            let obj = self[index!]
            if let xobj = obj as? [Any?] {
                aimItem = xobj
            }
        }
        return aimItem
    }
    
    func dictionaryItemFor(_ index: Int?) -> [AnyHashable : Any?] {
        var aimItem: [AnyHashable : Any?] = [:]
        if isValidJsonIndexInt(index) {
            let obj = self[index!]
            if let xobj = obj as? [AnyHashable : Any?] {
                aimItem = xobj
            }
        }
        return aimItem
    }
    
    func stringItemFor(_ index: Int?, defaultItem: String = "") -> String { //异常做四舍五入处理
        var aimItem: String = defaultItem
        if isValidJsonIndexInt(index) {
            let obj = self[index!]
            if let xobj = obj as? String {
                aimItem = Global.isNull(xobj) ? defaultItem : xobj
            }
            else if let xobj = obj as? Bool {
                aimItem = xobj ? "1" : "0"
            }
            else if let xobj = obj as? Int {
                aimItem = String(xobj)
            }
            else if let xobj = obj as? (any FixedWidthInteger & SignedInteger) {
                aimItem = String(xobj)
            }
            else if let xobj = obj as? (any FixedWidthInteger & UnsignedInteger) {
                aimItem = String(xobj)
            }
            else if let xobj = obj as? Double {
                aimItem = xobj.stringRound(abnormalResult: defaultItem)
            }
            else if let xobj = obj as? Float {
                aimItem = xobj.stringRound(abnormalResult: defaultItem)
            }
            else if let xobj = obj as? Character {
                aimItem = String(xobj)
            }
            else if let xobj = obj as? Substring {
                aimItem = Global.isNull(xobj) ? defaultItem : String(xobj)
            }
            else if let xobj = obj as? NSNumber {
                aimItem = xobj.stringRound(abnormalResult: defaultItem)
            }
            else if let xobj = obj as? NSAttributedString {
                aimItem = Global.isNull(xobj) ? defaultItem : xobj.string
            }
        }
        return aimItem
    }
    
    func intItemFor(_ index: Int?, defaultItem: Int = 0) -> Int { //异常做截取整数处理
        var aimItem: Int = defaultItem
        if isValidJsonIndexInt(index) {
            let obj = self[index!]
            if let xobj = obj as? Int {
                aimItem = xobj
            }
            else if let xobj = obj as? (any FixedWidthInteger & SignedInteger) {
                aimItem = xobj.intConvert(abnormalResult: defaultItem)
            }
            else if let xobj = obj as? (any FixedWidthInteger & UnsignedInteger) {
                aimItem = xobj.intConvert(abnormalResult: defaultItem)
            }
            else if let xobj = obj as? Bool {
                aimItem = xobj ? 1 : 0
            }
            else if let xobj = obj as? Double {
                aimItem = xobj.intRound(abnormalResult: defaultItem, isUseRound: false)
            }
            else if let xobj = obj as? Float {
                aimItem = xobj.intRound(abnormalResult: defaultItem, isUseRound: false)
            }
            else if let xobj = obj as? String {
                aimItem = xobj.intRound(abnormalResult: defaultItem, isUseRound: false)
            }
            else if let xobj = obj as? Character {
                aimItem = String(xobj).intRound(abnormalResult: defaultItem, isUseRound: false)
            }
            else if let xobj = obj as? Substring {
                aimItem = String(xobj).intRound(abnormalResult: defaultItem, isUseRound: false)
            }
            else if let xobj = obj as? NSNumber {
                aimItem = xobj.intRound(abnormalResult: defaultItem, isUseRound: false)
            }
            else if let xobj = obj as? NSAttributedString {
                aimItem = xobj.string.intRound(abnormalResult: defaultItem, isUseRound: false)
            }
        }
        return aimItem
    }
    
    func doubleItemFor(_ index: Int?, defaultItem: Double = 0) -> Double { //异常暂不做处理
        var aimItem: Double = defaultItem
        if isValidJsonIndexInt(index) {
            let obj = self[index!]
            if let xobj = obj as? Double {
                aimItem = xobj
            }
            else if let xobj = obj as? Float {
                aimItem = Double(xobj)
            }
            else if let xobj = obj as? Bool {
                aimItem = xobj ? 1.0 : 0.0
            }
            else if let xobj = obj as? Int {
                aimItem = Double(xobj)
            }
            else if let xobj = obj as? (any FixedWidthInteger & SignedInteger) {
                aimItem = Double(xobj)
            }
            else if let xobj = obj as? (any FixedWidthInteger & UnsignedInteger) {
                aimItem = Double(xobj)
            }
            else if let xobj = obj as? String {
                aimItem = Double(xobj) ?? defaultItem
            }
            else if let xobj = obj as? Character {
                aimItem = Double(String(xobj)) ?? defaultItem
            }
            else if let xobj = obj as? Substring {
                aimItem = Double(String(xobj)) ?? defaultItem
            }
            else if let xobj = obj as? NSNumber {
                aimItem = (xobj as? Double) ?? defaultItem
            }
            else if let xobj = obj as? NSAttributedString {
                aimItem = Double(xobj.string) ?? defaultItem
            }
        }
        if (aimItem.isInfinite || aimItem.isNaN) && !aimItem.isEqual(to: defaultItem) {
            aimItem = defaultItem
        }
        return aimItem
    }
    
    func boolItemFor(_ index: Int?, defaultItem: Bool = false) -> Bool { //异常做截取整数处理
        var aimItem: Bool = defaultItem
        if isValidJsonIndexInt(index) {
            let obj = self[index!]
            if let xobj = obj as? Bool {
                aimItem = xobj
            }
            else if let xobj = obj as? Int {
                aimItem = xobj != 0 ? true : false
            }
            else if let xobj = obj as? (any FixedWidthInteger & SignedInteger) {
                aimItem = xobj.intConvert(abnormalResult: defaultItem ? 1 : 0) != 0 ? true : false
            }
            else if let xobj = obj as? (any FixedWidthInteger & UnsignedInteger) {
                aimItem = xobj.intConvert(abnormalResult: defaultItem ? 1 : 0) != 0 ? true : false
            }
            else if let xobj = obj as? Double {
                aimItem = xobj.intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
            }
            else if let xobj = obj as? Float {
                aimItem = xobj.intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
            }
            else if let xobj = obj as? String {
                if xobj == "true" || xobj == "TRUE" || xobj == "yes" || xobj == "YES" || xobj == "1" || xobj == "y" || xobj == "Y" {
                    aimItem = true
                }
                else if xobj == "false" || xobj == "FALSE" || xobj == "no" || xobj == "NO" || xobj == "0" || xobj == "n" || xobj == "N" {
                    aimItem = false
                }
                else {
                    aimItem = xobj.intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
                }
            }
            else if let xobj = obj as? Character {
                aimItem = String(xobj).intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
            }
            else if let xobj = obj as? Substring {
                aimItem = String(xobj).intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
            }
            else if let xobj = obj as? NSNumber {
                aimItem = xobj.intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
            }
            else if let xobj = obj as? NSAttributedString {
                aimItem = xobj.string.intRound(abnormalResult: defaultItem ? 1 : 0, isUseRound: false) != 0 ? true : false
            }
        }
        return aimItem
    }
}



extension Array {
    static func valid(_ any: Any?) -> [Any?] {
        var aimValue: [Any?] = []
        if let xobj = any as? [Any?] {
            aimValue = xobj
        }
        return aimValue
    }
    
    func randomItem() -> Element? {
        if self.count > 0 {
            let index = Int(arc4random_uniform(UInt32(self.count)))
            return self[index]
        }
        return nil
    }
    
    func itemOrNilAt(_ index: Int) -> Element? {
        if index >= 0 && index < self.count {
            return self[index]
        }
        return nil
    }
    
    func jsonString(abnormalResult: String = "", isFormat: Bool = false) -> String {
        var aimStr = abnormalResult
        if JSONSerialization.isValidJSONObject(self) {
            var ops: JSONSerialization.WritingOptions = .init(rawValue: 0)
            if isFormat { ops = .prettyPrinted }
            if let data = try? JSONSerialization.data(withJSONObject: self, options: ops) {
                aimStr = String(data: data, encoding: .utf8) ?? abnormalResult
            }
        }
        return aimStr
    }
}
