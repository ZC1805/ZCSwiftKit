//
//  BasicMacro.swift
//  ZCSwiftKit
//
//  Created by zjy on 2023/1/3.
//

import UIKit
import Foundation

func Image(_ name: String) -> UIImage { UIImage(named: name) ?? UIImage()}

func ArrNonnil(_ arr: Any?) -> [Any?] { Array.valid(arr) }
func StrNonnil(_ str: Any?) -> String { String.valid(str) }
func DicNonnil(_ dic: Any?) -> [AnyHashable : Any?] { Dictionary.valid(dic) }

let ZSWid: CGFloat = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
let ZSHei: CGFloat = max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
let ZSRadio375: CGFloat = (ZSWid / 375.0)
let ZSScreen: CGRect = UIScreen.main.bounds
let ZSPixel: CGFloat = (1.0 / UIScreen.main.scale)
let IsIPhoneX: Bool = { ZSHei / ZSWid > 2.0 || ZSHei / ZSWid < 0.5 }()
func ZSA(_ radix: CGFloat) -> CGFloat { ((radix) * ZSRadio375) }

let ZSNaviHei: CGFloat = (IsIPhoneX ? 88.0 : 64.0)
let ZSNaviBarHei: CGFloat = (IsIPhoneX ? 44.0 : 44.0)
let ZSStuBarHei: CGFloat = (IsIPhoneX ? 44.0 : 20.0)
let ZSTabHei: CGFloat = (IsIPhoneX ? 83.0 : 49.0)
let ZSBomSafeHei: CGFloat = (IsIPhoneX ? 34.0 : 20.0)
