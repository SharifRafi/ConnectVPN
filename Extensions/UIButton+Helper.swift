//
//  UIButton+Helper.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import UIKit

class ScheduleButton: UIButton {

    func selectButton(){
        self.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.003921568627, blue: 0.4039215686, alpha: 1)
        self.titleLabel?.textColor = UIColor.white
        self.isSelected = true
    }
    
    func deselectButton(){
        self.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.9450980392, blue: 0.9568627451, alpha: 1)
        self.titleLabel?.textColor = UIColor.darkGray
        self.isSelected = false
    }

}

@IBDesignable extension UIButton {
    
    func adjustBtnText(){
        self.titleLabel?.minimumScaleFactor = 0.3
        self.titleLabel?.numberOfLines = 1
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
