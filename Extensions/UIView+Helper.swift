//
//  UIView+Helper.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import UIKit

extension UIView {
    
    @IBInspectable var _cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: convertFromCATransitionType(CATransitionType.fade))
    }
    
    func setRoundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        self.clipsToBounds = true
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func setCornerRadious(value: CGFloat){
        self.layer.cornerRadius = value
    }
    
    func setBorderWidth(value: CGFloat){
        self.layer.borderWidth = value
    }
    
    func setBorderColor(value: UIColor){
        self.layer.borderColor = value.cgColor
    }
    
    func setBackgroundColor(value: UIColor){
        self.backgroundColor = value
    }
    
    func setDropShadow(shadowOpacity: Float, shadowRadius: CGFloat, shadowOffset: CGSize, shadowColor: CGColor) {
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.shadowColor = shadowColor
    }
    
    func makeRoundedView() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        self.layer.add(animation, forKey: nil)
    }
    
    func transectionFromLeftToRight(vc: UIViewController){
        let transition = CATransition()
            transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
        vc.navigationController?.view.layer.add(transition, forKey: nil)
    }
    
    func makeViewBorderStyle(cornerRadius: CGFloat = 8, borderWidth: CGFloat = 1, color: UIColor = UIColor.lightGray){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        var borderColor = color
        if borderColor == UIColor.lightGray{
            if #available(iOS 13.0, *) {
                borderColor = UIColor.systemGray3
            } else {
                borderColor = UIColor.lightGray
            }
        }
        self.layer.borderColor = borderColor.cgColor
    }
    
    func makeViewBorderShadow(shadowOpacity: Float = 0.25, shadowRadius: CGFloat = 4, width: CGFloat = -1, height: CGFloat = 1, shadowColor: CGColor = UIColor.black.cgColor, cornerRadius: CGFloat = 8){
        self.layer.cornerRadius = cornerRadius
        self.setDropShadow(shadowOpacity: shadowOpacity, shadowRadius: shadowRadius, shadowOffset: CGSize(width: width, height: height), shadowColor: shadowColor)
        self.layer.masksToBounds = true
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromCATransitionType(_ input: CATransitionType) -> String {
    return input.rawValue
}

extension UIView {
  func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
      self.layer.maskedCorners = corners
      self.layer.cornerRadius = radius
   
  }
}
