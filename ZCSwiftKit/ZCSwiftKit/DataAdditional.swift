//
//  DataAdditional.swift
//  ZCSwiftKit
//
//  Created by zjy on 2022/12/29.
//

import Foundation

extension Data {
    func utf8String() -> String {
        if self.count > 0 {
            return String(data: self, encoding: .utf8) ?? ""
        }
        return ""
    }
    
    func jsonObject(abnormalResult: Any? = nil) -> Any? {
        var aimObject = abnormalResult
        let ops: JSONSerialization.ReadingOptions = .init(rawValue: 0)
        if let object = try? JSONSerialization.jsonObject(with: self, options: ops) {
            aimObject = object
        }
        return aimObject
    }
    
    func jsonArray(abnormalResult: [Any?] = []) -> [Any?] {
        var aimObject = abnormalResult
        let ops: JSONSerialization.ReadingOptions = .init(rawValue: 0)
        if let object = try? JSONSerialization.jsonObject(with: self, options: ops), let xobject = object as? [Any?] {
            aimObject = xobject
        }
        return aimObject
    }
    
    func jsonDictionary(abnormalResult: [AnyHashable : Any?] = [:]) -> [AnyHashable : Any?] {
        var aimObject = abnormalResult
        let ops: JSONSerialization.ReadingOptions = .init(rawValue: 0)
        if let object = try? JSONSerialization.jsonObject(with: self, options: ops), let xobject = object  as? [AnyHashable : Any?] {
            aimObject = xobject
        }
        return aimObject
    }
}

