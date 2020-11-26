//
//  Extentions.swift
//  SwedBankHomeWork
//
//  Created by BenyaminMokhtarpour on 10/5/20.
//  Copyright © 2020 BenyaminMokhtarpour. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}

extension UIApplication {
    
    static func topViewController(base: UIViewController? = ((UIApplication.shared.windows.first!.rootViewController as! UINavigationController).viewControllers.last)) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
    static func topNavigationController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UINavigationController? {
        if let nav = base as? UINavigationController {
            return nav
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topNavigationController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topNavigationController(base: presented)
        }
        
        return nil
    }
    
}

extension UIFont {
    
    enum FontWeight {
        case ultraLight
        case light
        case regular
        case medium
        case bold
    }
    
    class func fontIcon(ofSize fontSize: CGFloat) -> UIFont {
        return UIFont(name: "iGap_fontico", size: fontSize)!
    }
}
extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
extension Array {
    func unique<T:Hashable>(map: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>() //the unique list kept in a Set for fast retrieval
        var arrayOrdered = [Element]() //keeping the unique list of elements but ordered
        for value in self {
            if !set.contains(map(value)) {
                set.insert(map(value))
                arrayOrdered.append(value)
            }
        }
        return arrayOrdered.filter { $0 != nil }
    }
}

extension UIColor {
    
    public class func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
