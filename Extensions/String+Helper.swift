//
//  String+Helper.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import Foundation
import UIKit

extension String {
    
    func attributedStringWithColor(_ strings: [String], color: UIColor, characterSpacing: UInt? = nil) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        for string in strings {
            let range = (self as NSString).range(of: string)
            attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
            let myAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
            attributedString.addAttributes(myAttribute, range: range)
        }

        guard let characterSpacing = characterSpacing else {return attributedString}

        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))
        

        return attributedString
    }
    
    var isValidEmail: Bool {
        return NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    var htmlToAttributedString: NSAttributedString? {
        //        guard let data = data(using: .utf8) else { return nil }
        //        do {
        //            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        //        } catch {
        //            return nil
        //        }
        
        let style = "<style>body { font-family: '\("Helvetica Neue")'; font-size:\(15)px; }</style>"
        guard let data = (self + style).data(using: .utf8) else {
            return nil
        }
        do {
            return try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    func isValidWebURL() -> Bool {
        guard !contains("..") else { return false }
        
        let head     = "((http|https)://)?([(w|W)]{3}+\\.)?"
        let tail     = "\\.+[A-Za-z]{2,3}+(\\.)?+(/(.)*)?"
        let urlRegEx = head+"+(.)+"+tail
        
        let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
        return urlTest.evaluate(with: trimmingCharacters(in: .whitespaces))
    }
    
    func toLengthOf(length:Int) -> String {
        if length <= 0 {
            return self
        } else if let to = self.index(self.startIndex, offsetBy: length, limitedBy: self.endIndex) {
            return String(self[to...])
            
        } else {
            return ""
        }
    }
    
    func dateAndTimeWith(formate:String, date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate //"yyyy-MM-dd h:mm a"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from)
        return String(self[start ..< end])
    }
    
    func substring(range: NSRange) -> String {
        return substring(from: range.lowerBound, to: range.upperBound)
    }
    
    func trim()->String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    /**
     Returns subtring to x length starting from 1
     - Parameter to: length to n (Starting from 1)
     */
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[toIndex...]) //substring(to: toIndex)
    }
    
    var isInt: Bool {
        return Int(self) != nil
    }
    
    var containsNonWhitespace: Bool {
        return !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func chopPrefix(_ count: Int = 1) -> String {
        return count>self.count ? self : String(self[index(self.startIndex, offsetBy: count)...])
    }
    
    func dateTimeSubstruct(needle: String, beforeNeedle: Bool = false) -> String? {
        guard let range = self.range(of: needle) else { return nil }
        
        if beforeNeedle {
            return String(self[..<range.lowerBound].trimmingCharacters(in: .whitespaces))
        }
        return  String(self[range.upperBound...].trimmingCharacters(in: .whitespaces))
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    func split(regex pattern: String) -> [String] {
        
        guard let re = try? NSRegularExpression(pattern: pattern, options: [])
            else { return [] }
        
        let nsString = self as NSString // needed for range compatibility
        let stop = "<SomeStringThatYouDoNotExpectToOccurInSelf>"
        let modifiedString = re.stringByReplacingMatches(
            in: self,
            options: [],
            range: NSRange(location: 0, length: nsString.length),
            withTemplate: stop)
        return modifiedString.components(separatedBy: stop)
    }
    
    func toImage() -> UIImage? {
        let decodedData = NSData(base64Encoded: self, options: [])
        if let data = decodedData {
            let decodedimage = UIImage(data: data as Data)
            return decodedimage
        } else {
            print("error with decodedData")
            return nil
        }
    }
    
    func splitAtFirst(str: String, delimiter: String) -> (before: String, after: String)? {
        guard let upperIndex = (str.range(of: delimiter)?.upperBound), let lowerIndex = (str.range(of: delimiter)?.lowerBound) else { return nil }
        let firstPart: String = .init(str.prefix(upTo: lowerIndex))
        let lastPart: String = .init(str.suffix(from: upperIndex))
        return (firstPart, lastPart)
    }
    
}


extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    static func format(strings: [String],
                       boldFont: UIFont = UIFont.boldSystemFont(ofSize: 14),
                       boldColor: UIColor = UIColor.blue,
                       inString string: String,
                       font: UIFont = UIFont.systemFont(ofSize: 14),
                       color: UIColor = UIColor.black) -> NSAttributedString {
        let attributedString =
            NSMutableAttributedString(string: string,
                                      attributes: [
                                        NSAttributedString.Key.font: font,
                                        NSAttributedString.Key.foregroundColor: color])
        let boldFontAttribute = [NSAttributedString.Key.font: boldFont, NSAttributedString.Key.foregroundColor: boldColor]
        for bold in strings {
            attributedString.addAttributes(boldFontAttribute, range: (string as NSString).range(of: bold))
        }
        return attributedString
    }
}

extension String {
    func before(first delimiter: Character) -> String {
        if let index = firstIndex(of: delimiter) {
            let before = prefix(upTo: index)
            return String(before)
        }
        return ""
    }
    
    func after(first delimiter: Character) -> String {
        if let index = firstIndex(of: delimiter) {
            let after = suffix(from: index).dropFirst()
            return String(after)
        }
        return ""
    }
}
