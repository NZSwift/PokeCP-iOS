//
//  ExtentionUnits.swift
//  PokeCP
//
//  Created by Liguo Jiao on 16/8/19.
//  Copyright © 2016年 Liguo Jiao. All rights reserved.
//

import UIKit

let PCPColorBackground = UIColor(red: 47.0 / 255.0, green: 59.0 / 255.0, blue: 86.0 / 255.0, alpha: 1.0)
let PCPColorContent = UIColor(red: 65.0 / 255.0, green: 210.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
let PCPColorContentGray = UIColor(red: 179.0 / 255.0, green: 199.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0)
let PCPColorNavigationCyan = UIColor(red: 78.0 / 255.0, green: 185.0 / 255.0, blue: 171.0 / 255.0, alpha: 1.0)

let PCPColorRed = UIColor(red: 233.0 / 255.0, green: 100.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
let PCPColorBlue = UIColor(red: 60.0 / 255.0 , green: 160.0 / 255.0, blue: 196.0 / 255.0, alpha: 1.0)
let PCPColorAmber = UIColor(red: 244.0 / 255.0, green: 161.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0)


// MARK: - Device
public class Device {
    public class var isIpad:Bool {
        if #available(iOS 8.0, *) {
            return UIScreen.mainScreen().traitCollection.userInterfaceIdiom == .Pad
        } else {
            return UIDevice.currentDevice().userInterfaceIdiom == .Pad
        }
    }
    public class var isIphone:Bool {
        if #available(iOS 8.0, *) {
            return UIScreen.mainScreen().traitCollection.userInterfaceIdiom == .Phone
        } else {
            return UIDevice.currentDevice().userInterfaceIdiom == .Phone
        }
    }
}

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO          = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
}

// MARK: - UI Extension
extension UIView {
    func fadeIn(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)  }
    
    func fadeOut(duration: NSTimeInterval = 1.0, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
}

extension Int {
    func ordinal() -> String {
        return "\(self)\(ordinalSuffix())"
    }
    
    func ordinalSuffix() -> String {
        if (11...13).contains(self % 100) {
            return "th"
        }
        switch self % 10 {
        case 1: return "st"
        case 2: return "nd"
        case 3: return "rd"
        default: return "th"
        }
    }
    
}