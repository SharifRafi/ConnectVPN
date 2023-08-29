//
//  UIColor+Helper.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import UIKit

extension UIColor {
    
//    static var ssRed: UIColor? {
//        return UIColor(named: "ssRed")
//    }
//
    static var weBorderBlue: UIColor? {
        return UIColor(named: "weBorderBlue")
    }
    
    static var wcAlertBackgroundColir: UIColor? {
        return UIColor(named: "wcAlertBackgroundColir")
    }
    
    static var wcJTStatusRed: UIColor? {
        return UIColor(named: "wcJTStatusRed")
    }
    
    static var wcJTStatusGreen: UIColor? {
        return UIColor(named: "wcJTStatusGreen")
    }
    
    static var wcEmployeeNavBackground: UIColor? {
        return UIColor(named: "wcEmployeeNavBackground")
    }
    
    static var wcOfferBackground: UIColor? {
        return UIColor(named: "wcOfferBackground")
    }
    
    static var wcHighlitedLblColor: UIColor? {
        return UIColor(named: "wcHighlitedLblColor")
    }
    
    static var wcSkyButtonColor: UIColor? {
        return UIColor(named: "wcSkyButtonColor")
    }
    
    static var wcButtonBorder: UIColor? {
        return UIColor(named: "wcButtonBorder")
    }
    
    static var wcOrangeButtonColor: UIColor? {
        return UIColor(named: "wcOrangeButtonColor")
    }
    
    static var wcSearchTableBackground: UIColor? {
        return UIColor(named: "wcSearchTableBackground")
    }
    
    static var wcGreenButtonColor: UIColor? {
        return UIColor(named: "wcGreenButtonColor")
    }
    
    static var wcCustomBackground: UIColor? {
        return UIColor(named: "wcCustomBackground")
    }

    static var wcTextFieldBorder: UIColor? {
        return UIColor(named: "wcTextFieldBorder")
    }
    
    static var wcNavBorderColor: UIColor? {
        return UIColor(named: "wcNavBorderColor")
    }
    
    static var wcCellBackground: UIColor? {
        return UIColor(named: "wcCellBackground")
    }
    
    static var wcCellBorderColor: UIColor? {
        return UIColor(named: "wcCellBorderColor")
    }
    
    static var wcLowPriorityLabelColor: UIColor? {
        return UIColor(named: "wcLowPriorityLabelColor")
    }
    
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    convenience init?(hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }; fallthrough
        case 6: chars = ["F","F"] + chars
        case 8: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                  green: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                  blue: .init(strtoul(String(chars[6...7]), nil, 16)) / 255,
                  alpha: .init(strtoul(String(chars[0...1]), nil, 16)) / 255)
    }
}

