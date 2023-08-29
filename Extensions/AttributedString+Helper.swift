//
//  AttributedString+Helper.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

// https://stackoverflow.com/questions/27728466/use-multiple-font-colors-in-a-single-label
// https://stackoverflow.com/questions/34813634/uilabel-text-with-different-font-size-and-color

import UIKit

extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor, font: UIFont = UIFont.systemFont(ofSize: 12)) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttributes([NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : color], range: range)
        //self.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
    }
    
    func setFontForText(textForAttribute: String, font: UIFont) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
    
}

/**
 let stringValue = "stackoverflow"
 let attributedString = NSMutableAttributedString(string: stringValue)
 attributedString.setColorForText(textForAttribute: "stack", withColor: UIColor.black)
 attributedString.setColorForText(textForAttribute: "over", withColor: UIColor.orange, font: UIFont.systemFont(ofSize: 20))
 attributedString.setColorForText(textForAttribute: "flow", withColor: UIColor.red)
 
 label.attributedText = attributedString
 */
