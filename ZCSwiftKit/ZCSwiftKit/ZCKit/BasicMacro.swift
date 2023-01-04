//
//  BasicMacro.swift
//  ZCSwiftKit
//
//  Created by zjy on 2023/1/3.
//

import UIKit
import Foundation

func Adapt(_ radix: CGFloat) -> CGFloat { ((radix) * kRadio375) }
func Image(_ name: String) -> UIImage { UIImage(named: name) ?? UIImage()}

func ArrNonnil(_ arr: Any?) -> [Any?] { Array.validArray(arr) }
func StrNonnil(_ str: Any?) -> String { String.validString(str) }
func DicNonnil(_ dic: Any?) -> [AnyHashable : Any?] { Dictionary.validDictionary(dic) }

let kWid: CGFloat = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
let kHei: CGFloat = max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
let kRadio375: CGFloat = (kWid / 375.0)
let kScreen: CGRect = UIScreen.main.bounds
let kPixel: CGFloat = (1.0 / UIScreen.main.scale)
let kIsIPhoneX: Bool = { kHei / kWid > 2.0 || kHei / kWid < 0.5 }()

let kNaviHei: CGFloat = (kIsIPhoneX ? 88.0 : 64.0)
let kNaviBarHei: CGFloat = (kIsIPhoneX ? 44.0 : 44.0)
let kStuBarHei: CGFloat = (kIsIPhoneX ? 44.0 : 20.0)
let kTabHei: CGFloat = (kIsIPhoneX ? 83.0 : 49.0)
let kBomSafeHei: CGFloat = (kIsIPhoneX ? 34.0 : 20.0)
