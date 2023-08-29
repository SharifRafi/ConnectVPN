//
//  UITextField+Icon.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import UIKit

@IBDesignable
class DesignableUITextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
            
        return textRect
    }

    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }

    @IBInspectable var leftPadding: CGFloat = 0

    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }

    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            // Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
  
}

extension UITextField {
    
    func setRightIcon(iconName:String) {
        let imgView = UIImageView(image: UIImage(named: iconName))
        rightView = imgView
        rightViewMode = .always
        
    }
    
    func setTextField(borderStyle: UITextField.BorderStyle, backgroundColor: CGColor, cornerRadius: CGFloat, borderWidth: CGFloat) {
        self.borderStyle = borderStyle
        self.layer.backgroundColor = backgroundColor 
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        
        if #available(iOS 13.0, *) {
            self.layer.borderColor = UIColor.systemBackground.cgColor
        } else {
            self.layer.borderColor = UIColor.white.cgColor
        }
        
    }
    
}
