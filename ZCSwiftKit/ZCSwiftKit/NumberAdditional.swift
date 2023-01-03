//
//  NumberAdditional.swift
//  ZCSwiftKit
//
//  Created by zjy on 2022/12/30.
//

import Foundation

extension Double {
    static let double_formatter: NumberFormatter = {
        let formatter = NumberFormatter.init()
        formatter.numberStyle = .decimal
        formatter.locale = nil
        formatter.decimalSeparator = "."
        formatter.negativePrefix = "-"
        formatter.positivePrefix = ""
        formatter.groupingSize = 0
        formatter.secondaryGroupingSize = 0
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 15
        formatter.roundingMode = .halfUp
        return formatter
    }()
    
    func stringRound(abnormalResult: String = "0") -> String {
        var result = abnormalResult
        if !self.isInfinite && !self.isNaN {
            result = Double.double_formatter.string(for: self) ?? abnormalResult
        }
        return result
    }
    
    func intRound(abnormalResult: Int = 0, isUseRound: Bool = false) -> Int {
        var result = abnormalResult
        if !self.isInfinite && !self.isNaN {
            if isUseRound {
                result = Int(self.rounded(.toNearestOrAwayFromZero))
            } else {
                result = Int(self)
            }
        }
        return result
    }
}



extension Float {
    static let float_formatter: NumberFormatter = {
        let formatter = NumberFormatter.init()
        formatter.numberStyle = .decimal
        formatter.locale = nil
        formatter.decimalSeparator = "."
        formatter.negativePrefix = "-"
        formatter.positivePrefix = ""
        formatter.groupingSize = 0
        formatter.secondaryGroupingSize = 0
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 6
        formatter.roundingMode = .halfUp
        return formatter
    }()
    
    func stringRound(abnormalResult: String = "0") -> String {
        var result = abnormalResult
        if !self.isInfinite && !self.isNaN {
            result = Float.float_formatter.string(for: self) ?? abnormalResult
        }
        return result
    }
    
    func intRound(abnormalResult: Int = 0, isUseRound: Bool = false) -> Int {
        var result = abnormalResult
        if !self.isInfinite && !self.isNaN {
            if isUseRound {
                result = Int(self.rounded(.toNearestOrAwayFromZero))
            } else {
                result = Int(self)
            }
        }
        return result
    }
}



extension NSNumber {
    static let number_formatter: NumberFormatter = {
        let formatter = NumberFormatter.init()
        formatter.numberStyle = .decimal
        formatter.locale = nil
        formatter.decimalSeparator = "."
        formatter.negativePrefix = "-"
        formatter.positivePrefix = ""
        formatter.groupingSize = 0
        formatter.secondaryGroupingSize = 0
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 15
        formatter.roundingMode = .halfUp
        return formatter
    }()
    
    func stringRound(abnormalResult: String = "0") -> String {
        var result = abnormalResult
        if !self.doubleValue.isInfinite && !self.doubleValue.isNaN {
            result = NSNumber.number_formatter.string(from: self) ?? abnormalResult
        }
        return result
    }
    
    func intRound(abnormalResult: Int = 0, isUseRound: Bool = false) -> Int {
        var result = abnormalResult
        if !self.doubleValue.isInfinite && !self.doubleValue.isNaN {
            if isUseRound {
                result = Int(self.doubleValue.rounded(.toNearestOrAwayFromZero))
            } else {
                result = self.intValue
            }
        }
        return result
    }
}



extension NSDecimalNumber {
    func isSomeNumber() -> Bool {
        return self.compare(NSDecimalNumber.notANumber) == ComparisonResult.orderedSame ? false : true
    }
}



extension FixedWidthInteger {
    func intConvert(abnormalResult: Int = 0) -> Int {
        var result = abnormalResult
        if let x = self as? Int {
            result = x
        }
        else if let x = self as? UInt {
            if x <= 9223372036854775807 {
                result = Int(x)
            }
        }
        else if let x = self as? UInt64 {
            if x <= 9223372036854775807 {
                result = Int(x)
            }
        }
        else if let x = self as? (any SignedInteger) {
            result = Int(x)
        }
        else if let x = self as? (any UnsignedInteger) {
            result = Int(x)
        }
        return result
    }
}
