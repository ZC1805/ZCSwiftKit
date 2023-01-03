//
//  StringAdditional.swift
//  ZCSwiftKit
//
//  Created by zjy on 2022/12/29.
//

import Foundation

extension String {
    static func valid(_ any: Any?) -> String {
        var aimValue: String = ""
        if let xobj = any as? String, !Global.isNull(xobj, isNotCheckNumber: true) {
            aimValue = xobj
        }
        else if let xobj = any as? Character, !Global.isNull(xobj, isNotCheckNumber: true) {
            aimValue = String(xobj)
        }
        else if let xobj = any as? Substring, !Global.isNull(xobj, isNotCheckNumber: true) {
            aimValue = String(xobj)
        }
        else if let xobj = any as? NSAttributedString, !Global.isNull(xobj, isNotCheckNumber: true) {
            aimValue = xobj.string
        }
        return aimValue
    }
    
    func intRound(abnormalResult: Int = 0, isUseRound: Bool = false) -> Int {
        var result = abnormalResult
        let double = Double(self) ?? Double(abnormalResult)
        if !double.isInfinite && !double.isNaN {
            if isUseRound {
                result = Int(double.rounded(.toNearestOrAwayFromZero))
            } else {
                result = Int(double)
            }
        }
        return result
    }
    
    func dataObject(abnormalResult: Data? = nil) -> Data? {
        var aimObject = abnormalResult
        if let object = self.data(using: .utf8) {
            aimObject = object
        }
        return aimObject
    }
    
    func jsonObject(abnormalResult: Any? = nil) -> Any? {
        return self.dataObject(abnormalResult: nil)?.jsonObject(abnormalResult: abnormalResult)
    }
    
    func jsonArray(abnormalResult: [Any?] = []) -> [Any?] {
        return self.dataObject(abnormalResult: nil)?.jsonArray(abnormalResult: abnormalResult) ?? abnormalResult
    }
    
    func jsonDictionary(abnormalResult: [AnyHashable : Any?] = [:]) -> [AnyHashable : Any?] {
        return self.dataObject(abnormalResult: nil)?.jsonDictionary(abnormalResult: abnormalResult) ?? abnormalResult
    }
}
