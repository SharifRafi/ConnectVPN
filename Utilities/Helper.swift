//
//  Helper.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import UIKit
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG
import SVProgressHUD

struct Helper{
    
    static var lastApiCalledTime: Double = 0.0
    static var okAlertBtnTap : (()-> Void)? = nil
    static var cancleAlertBtnTap : (() -> Void)? = nil
    
    static var deviceID: String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    static var appVersion: String {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return "N/A" }
        return version
    }
    
    static var buildNo: String{
        guard let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else {return "N/A"}
        return build
    }
    
    static func getFirstString (str: String)-> String.SubSequence{
        let firstSpace = str.firstIndex(of: " ") ?? str.endIndex
        let firstString = str[..<firstSpace]
        return firstString
    }
    
    static func emptyMessageInCollectionView(_ collectionView: UICollectionView,_ title: String){
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height))
        noDataLabel.textColor        = .lightGray
        noDataLabel.font             = UIFont(name: "Open Sans", size: 15)
        noDataLabel.textAlignment    = .center
        collectionView.backgroundView = noDataLabel
        noDataLabel.text = title
    }
    
    static func emptyMessageInTableView(_ tableView: UITableView,_ title: String){
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        noDataLabel.textColor        = UIColor(hexString: "#8D9EC8")
        noDataLabel.font             = UIFont(name: "Open Sans", size: 15)
        noDataLabel.textAlignment    = .center
        tableView.backgroundView = noDataLabel
        tableView.separatorStyle = .none
        noDataLabel.text = title
    }
    
    static func loadJSON(jsonFileName name: String) -> Data?{
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                print("error)")
            }
        }
        return nil
    }
    
    static func getLoginStatus(isShowAlert: Bool = true) -> Bool {
        let token = Helper.getStringData(key: Constants.wcToken)
        if token.isEmpty{
            if isShowAlert{
                Helper.showAlertWithOkAndCancel(title: "Don't Login?", msg: "Please Login first") {
                    RootVCHelper.setToDashboardVC()
                }
            }
            return false
        } else {
            return true
        }
    }
    
    static func getPercentageValue(oldValue: Double, newValue: Double) -> String {
        let discount = oldValue - newValue
        if discount > 0{
            let percentage = round((discount * 100) / oldValue)
            return (String(Int(percentage)) + "%")
        }else{
            return "0%"
        }
    }
    
    static func getDate(time:Int)->String{
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "yyyy.MM.dd"
        return dateFormatter.string(from: date)
    }
    
    static func convertDateTimeToDate(time:String)->String{
        let datetime = time.components(separatedBy: " ")
        let dateOnly = datetime[0].replacingOccurrences(of: "-", with: ".")
        return dateOnly
    }
    
    static func convertDateFormet(dateString: String, format: String = "yyyy-MM-dd", getDateFormat: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        formatter.dateFormat = getDateFormat
        let date = formatter.date(from: dateString) ?? Date()
        
        formatter.dateFormat = format
        let somedateString = formatter.string(from: date)
        return somedateString
    }
    
    static func convertStringDataToDateFormet(dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: dateString) ?? Date()
        return date
    }
    
    static func getCurrentDateInString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        let date = Date()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let somedateString = formatter.string(from: date)
        return somedateString
    }
    
    static func getJustCurrentDateInString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        let date = Date()
        
        formatter.dateFormat = "MM-dd-yyyy"
        let somedateString = formatter.string(from: date)
        return somedateString
    }
    
    static func getCurrentDateForInstantTrip() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        let date = Date()
        
        formatter.dateFormat = "dd/MM/yyyy"
        let somedateString = formatter.string(from: date)
        return somedateString
    }
    
    static func getCurrentDateForInstantTripInputFormat() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        let date = Date()
        
        formatter.dateFormat = "yyyy-MM-dd"
        let somedateString = formatter.string(from: date)
        return somedateString
    }
    
    static func getCurrentDateWithCustomFormatString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        let date = Date()
        
        formatter.dateFormat = format
        let somedateString = formatter.string(from: date)
        return somedateString
    }
    
    static func getCurrentTimeForInstantTrip() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        let date = Date()
        
        formatter.dateFormat = "HH:mm a"
        let somedateString = formatter.string(from: date)
        return somedateString
    }
    
    static func getSpecificValueFromDate(dateForm: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        let formatterDate = Date()
        formatter.dateFormat = dateForm
        let somedateString = formatter.string(from: formatterDate)
        return somedateString
    }
    
    static func getLastDayOfMonth() -> Int {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        let formatterDate = Date()
        formatter.dateFormat = "MM"
        let dateString = formatter.string(from: formatterDate)
        if dateString == "02"{
            return 28
        }else if dateString == "04" || dateString == "06" || dateString == "09" || dateString == "11"{
            return 30
        }else{
            return 31
        }
    }
    
    static func getLastDayOfPreviousMonth() -> Int {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        let formatterDate = Date()
        formatter.dateFormat = "MM"
        let dateString = formatter.string(from: formatterDate)
        if dateString == "03"{
            return 28
        }else if dateString == "05" || dateString == "07" || dateString == "10" || dateString == "12"{
            return 30
        }else{
            return 31
        }
    }
    
    static func getDayOfThisMonth() -> Int {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        let formatterDate = Date()
        formatter.dateFormat = "dd"
        let dateString = formatter.string(from: formatterDate)
        return Int(dateString) ?? 0
    }
    
    static func convertDataToDateAndTime(dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "US_en")
        formatter.dateFormat = "dd-MMM-yy hh.mm.ss.SSS a"
        let date = formatter.date(from: dateString) ?? Date()
        
        formatter.dateFormat = "hh:mm a yyyy-mm-dd"
        let somedateString = formatter.string(from: date)
        return somedateString
    }
    
    static func getDateWithWeek(time:Int)->String{
        let getCurrentDate = Int(Date().toSec())
        
        let weatherDate = Date(timeIntervalSince1970: TimeInterval(time))
        let Currentdate = Date(timeIntervalSince1970: TimeInterval(getCurrentDate))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "EEE, dd MMM"
        let weatherFormatedDate =  dateFormatter.string(from: weatherDate)
        let currentFormatedDate =  dateFormatter.string(from: Currentdate)
        if(weatherFormatedDate == currentFormatedDate){
            return "Today"
        }else{
            return weatherFormatedDate
        }
    }
    
    static func normalBoldLblStyle(boldText: String, normalText: String) -> NSMutableAttributedString {
        let boldAttrs = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        let attributedString = NSMutableAttributedString(string: boldText, attributes: boldAttrs)
        
        let noralAttrs = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        let normalString = NSMutableAttributedString(string: normalText, attributes: noralAttrs)
        
        attributedString.append(normalString)
        
        return attributedString
    }
    
    //MARK: Child VC Helpers
    static func addAsChildVC(_ childVC: UIViewController, to containerView: UIView, with parentVC: UIViewController) {
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        parentVC.addChild(childVC)
        addSubview(subView: childVC.view, toView: containerView)
        childVC.didMove(toParent: parentVC)
    }
    
    static private func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        subView.backgroundColor = UIColor.clear
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|", options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|", options: [], metrics: nil, views: viewBindingsDict))
    }
    
    static func removeAsChildVC(childVC: UIViewController) {
        childVC.willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
    }
    
    static func getFormatedImgWithBaseStrAndName(_ image:UIImage) -> (UIImage?, String?, String?, data: Data) {
        
        guard let imageData = Helper.getCompressedImgData(image) else {return (UIImage(named: "ic_profile_placeholder"),nil,nil, Data())}
        let timeStamp = String(Date().ticks)
        let base64StrForAPI = imageData.base64EncodedString()
        return (UIImage(data: imageData), base64StrForAPI, timeStamp, imageData)
    }
    
    static func getFormatedImgWithBaseStrAndName(_ images:[UIImage]) -> [ImageModel]? {
        guard images.count > 0 else { return nil}
        var imageList = [ImageModel]()
        for image in images{
            guard let imageData = Helper.getCompressedImgData(image) else {return nil}
            let timeStamp = String(Date().ticks)
            let base64StrForAPI = imageData.base64EncodedString()
            
            let model = ImageModel(image: UIImage(data: imageData), base64Data: base64StrForAPI, imageName: timeStamp)
            imageList.append(model)
        }
        return imageList
    }
    
    private static func getCompressedImgData(_ image:UIImage) -> Data? {
        guard let imageData = image.jpegData(compressionQuality: 0.1) else {return nil}
        let bytes = imageData.count
        let KB = Double(bytes) / 1024.0 // Note the difference
        let MB = KB/1024
        DLog("Image Size KB = \(KB), MB = \(MB)")
        if KB < 900{
            return imageData
        }else{
            Helper.showCustomAlert(title: "", msg: "The selected image is too large.", alertType: .somethingWroong)
            return nil
        }
    }
    
    static func convertBase64StringToImage (imageBase64String: String) -> UIImage {
        let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
        let image = UIImage(data: imageData!)
        return image!
    }
    
    static func getAppVersion() -> String {
        return "\(Bundle.main.infoDictionary!["CFBundleShortVersionString"] ?? "")"
    }
    
    static func openUrl(url: String){
        guard let url = URL(string: url) else { return }
        UIApplication.shared.open(url)
    }
    
    static func mobileNoTrimer(phone: String)-> String{
        let prefix = "880"
        var finalPhone = phone
        guard finalPhone.hasPrefix(prefix) else { return finalPhone}
        finalPhone  = String(finalPhone.dropFirst(prefix.count).trimmingCharacters(in: .whitespacesAndNewlines))
        return finalPhone
    }
    
    static func removeSpecialCharsFromString(text: String) -> String {
        let okayChars = Set("1234567890")
        return text.filter {okayChars.contains($0) }
    }
    
    //MARK: Alert Helpers
    static func showComingSoonAlert(from vc:UIViewController) {
        let alertController = UIAlertController(title: "Coming Soon", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    static func showInternetUnreachable() {
        let alertVC = UIAlertController(title: "Internet Connection Not Available", message: "Please Enable Your Wifi Or Cellular Network", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(okAction)
        alertVC.show()
    }
    
    static func showCustomAlert(title: String?, msg: String?, alertType: AlertType){
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        let frame = parentVC.view.bounds
        let popup = CustomAlertPresenter(frame: frame)
        popup.configure(title: title, msg: msg, alertType: alertType)
        parentVC.view.addSubview(popup)
    }
    
    static func showCustomAlertWithOkAction(title: String?, msg: String?, alertType: AlertType, result: @escaping () -> ()){
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        let frame = parentVC.view.bounds
        let popup = CustomAlertPresenter(frame: frame)
        popup.configure(title: title, msg: msg, alertType: alertType, result: result)
        parentVC.view.addSubview(popup)
    }
    
    static func showCustomAlertWithOkAndCancelAction(title: String?, msg: String?, alertType: AlertType, result: @escaping () -> (), cancelResult: @escaping () -> ()){
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        let frame = parentVC.view.bounds
        let popup = CustomAlertPresenter(frame: frame)
        popup.configure(title: title, msg: msg, alertType: alertType, doneResult: result, cancelResult: cancelResult)
        parentVC.view.addSubview(popup)
    }
    
    static func showAlert(msg: String) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        //to change font of title and message.
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 18.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 16.0)!]

        let titleAttrString = NSMutableAttributedString(string: "", attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: msg, attributes: messageFont)

        alert.setValue(titleAttrString, forKey: "attributedTitle")
        alert.setValue(messageAttrString, forKey: "attributedMessage")

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        parentVC.present(alert, animated: true, completion: nil)
    }
    
    static func showAlert(msg: String, vc: UIViewController?) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        //to change font of title and message.
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 18.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 16.0)!]

        let titleAttrString = NSMutableAttributedString(string: "", attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: msg, attributes: messageFont)

        alert.setValue(titleAttrString, forKey: "attributedTitle")
        alert.setValue(messageAttrString, forKey: "attributedMessage")

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        if vc != nil{
            vc!.present(alert, animated: true, completion: nil)
        }else{
            parentVC.present(alert, animated: true, completion: nil)
        }
    }
    
    static func showAlertWithTitle(title: String, description: String){
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 18.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 16.0)!]

        let titleAttrString = NSMutableAttributedString(string: title, attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: description, attributes: messageFont)

        alert.setValue(titleAttrString, forKey: "attributedTitle")
        alert.setValue(messageAttrString, forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        parentVC.present(alert, animated: true, completion: nil)
    }
    
    
    static func showAlertWithTitleForLogin(title: String, msg: String){
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 18.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 16.0)!]

        let titleAttrString = NSMutableAttributedString(string: title, attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: msg, attributes: messageFont)

        alertController.setValue(titleAttrString, forKey: "attributedTitle")
        alertController.setValue(messageAttrString, forKey: "attributedMessage")
        let loginAction = UIAlertAction(title: "Login", style: UIAlertAction.Style.default) {
            UIAlertAction in
            DLog("Login Pressed")
            okAlertBtnTap?()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
        }
        
        alertController.addAction(loginAction)
        alertController.addAction(cancelAction)
        
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        parentVC.present(alertController, animated: true, completion: nil)
    }
    
    static func showAlertWithTitleForProfile(title: String, msg: String){
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 18.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 16.0)!]

        let titleAttrString = NSMutableAttributedString(string: title, attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: msg, attributes: messageFont)

        alertController.setValue(titleAttrString, forKey: "attributedTitle")
        alertController.setValue(messageAttrString, forKey: "attributedMessage")
        let loginAction = UIAlertAction(title: "Login", style: UIAlertAction.Style.default) {
            UIAlertAction in
            DLog("Login Pressed")
            okAlertBtnTap?()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            DLog("Cancle Pressed")
            cancleAlertBtnTap?()
        }
        
        alertController.addAction(loginAction)
        alertController.addAction(cancelAction)
        
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        parentVC.present(alertController, animated: true, completion: nil)
    }
    
    static func showAlertWithOkAndCancel(title: String, msg: String, result: @escaping () -> ()) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 18.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 16.0)!]

        let titleAttrString = NSMutableAttributedString(string: title, attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: msg, attributes: messageFont)

        alert.setValue(titleAttrString, forKey: "attributedTitle")
        alert.setValue(messageAttrString, forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            result()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: {_ in
        }))
        
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        parentVC.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertForUpdateApp(title: String, msg: String, result: @escaping () -> (), cancelResult: @escaping () -> ()) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 18.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 16.0)!]

        let titleAttrString = NSMutableAttributedString(string: title, attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: msg, attributes: messageFont)

        alert.setValue(titleAttrString, forKey: "attributedTitle")
        alert.setValue(messageAttrString, forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { _ in
            result()
        }))
        
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in
            cancelResult()
        }))
        
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        parentVC.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertWithOnlyOkAction(title: String, msg: String, result: @escaping () -> ()) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 18.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 16.0)!]

        let titleAttrString = NSMutableAttributedString(string: title, attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: msg, attributes: messageFont)

        alert.setValue(titleAttrString, forKey: "attributedTitle")
        alert.setValue(messageAttrString, forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            result()
        }))
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        parentVC.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertWithOkActionAndDownload(title: String, msg: String, result: @escaping () -> (), downloadAction: @escaping () -> ()) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 18.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 16.0)!]

        let titleAttrString = NSMutableAttributedString(string: title, attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: msg, attributes: messageFont)

        alert.setValue(titleAttrString, forKey: "attributedTitle")
        alert.setValue(messageAttrString, forKey: "attributedMessage")
        alert.addAction(UIAlertAction(title: "Download PDF", style: .default, handler: { _ in
            downloadAction()
        }))
        
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in
            result()
        }))
        
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        parentVC.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertWithOutInteraction(title: String, msg: String, result: @escaping () -> ()) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 18.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "DMSans-Regular", size: 16.0)!]

        let titleAttrString = NSMutableAttributedString(string: title, attributes: titleFont)
        let messageAttrString = NSMutableAttributedString(string: msg, attributes: messageFont)

        alert.setValue(titleAttrString, forKey: "attributedTitle")
        alert.setValue(messageAttrString, forKey: "attributedMessage")
        var mwindow: UIWindow?
        if #available(iOS 13.0, *) {
            mwindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
        } else {
            mwindow = UIApplication.shared.keyWindow!
        }
        alert.dismiss(animated: true) {
            result()
        }
        guard let parentVC = mwindow?.visibleViewController() else {return}
        parentVC.present(alert, animated: true, completion: nil)
    }
    
    static func getDate(date: String)-> Date{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        guard let date = formatter.date(from: date) else {return Date()}
        return date
    }
    
    
    static func callNumber(phoneNumber:String){
        
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }else{
                showAlert(msg: "Call is not supported")
            }
        }else{
            showAlert(msg: "Phone number is not supported")
        }
    }
    
    static func getBase64Images(images: [ImageModel])-> [String]{
        var base64Images = [String]()
        for image in images{
            base64Images.append(image.base64Data ?? "")
        }
        return base64Images
    }
    
    static func openWebsite(withUrl: String){
        if let url = URL(string: withUrl) {
            UIApplication.shared.open(url)
        }
    }
    
    static func isValidateError(errorMsg:String?, errorCode: Int?)-> Bool{
        if errorCode == nil {
            return false
        }
        let msg = errorMsg ?? "Server Error"
        Helper.showCustomAlert(title: "Error", msg: msg, alertType: .fail)
        return true
    }
    
    static func MD5(salt: String, key: String) -> String {
        let string = key + salt
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)
        
        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        let md5Hex =  digestData.map { String(format: "%02hhx", $0) }.joined()
        return md5Hex
    }
    
    static func randomStringForSalt(length: Int = 64) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    static func getSignSaltForHeader() -> String {
        let salt  = Helper.randomStringForSalt()
        let sign = Helper.MD5(salt: salt, key: Constants.keyForSign)

        return "\(salt).\(sign)"
    }
    
    static func getQueryParams() -> String {
//        let salt  = Helper.randomStringForSalt()
//        let sign = Helper.MD5(salt: salt, key: Constants.keyForSign)
//
        return "json=true&client_type=2&client_version=\(Constants.clientVersionNo)"
    }

    
    
    //MARK: 1st 3 digit of mobile number check
    static func mobileNumberPrefixChecker(prefix: String)-> Bool {
        
        for data in (Constants.phoneNumberPrefixList){
            if data == prefix{
                return true
            }
        }
        return false
    }
    
    
    //MARK: Get Local Data
    static func getStringData(key: String) -> String {
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
    
    static func getIntData(key: String)-> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    static func getBoolData(key: String)-> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    static func getDoubleData(key: String) -> Double {
        return UserDefaults.standard.double(forKey: key)
    }
    
    static func getDateData(key: String) -> Date? {
        return UserDefaults.standard.object(forKey: key)  as? Date
    }
    
    static func getStringArrData(key: String) -> [String]? {
        return UserDefaults.standard.object(forKey: key) as? [String]
    }
    
    //MARK: Save Local Data
    
    static func saveData(data: Any, key: String) {
        UserDefaults.standard.set(data, forKey: key)
        UserDefaults.standard.synchronize()
    }

    static func savePdf(urlString:String, fileName:String) {
           DispatchQueue.main.async {
               SVProgressHUD.show()
               if let url = URL(string: urlString){
                   if let pdfData = try? Data.init(contentsOf: url){
                       if let resourceDocPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last{
                           let pdfNameFromUrl = "iAWAZ-\(fileName).pdf"
                           let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
                           do {
                               try pdfData.write(to: actualPath, options: .atomic)
                               SVProgressHUD.dismiss()
                               Helper.showAlert(msg: "Download Completed.")
                               print("pdf successfully saved!")
                           } catch {
                               SVProgressHUD.dismiss()
                               Helper.showAlert(msg: "Download Failed.")
                               print("Pdf could not be saved")
                           }
                       }else{
                           SVProgressHUD.dismiss()
                       }
                   }else{
                       SVProgressHUD.dismiss()
                   }
               }else{
                   SVProgressHUD.dismiss()
               }
               
               
           }
       }

   // check to avoid saving a file multiple times
    static func pdfFileAlreadySaved(url:String, fileName:String)-> Bool {
       var status = false
        do {
            let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
            for url in contents {
                if url.description.contains("awaz-\(fileName).pdf") {
                    status = true
                }
            }
        } catch {
            print("could not locate pdf file !!!!!!!")
        }
       return status
   }
}

struct ImageModel{
    var image: UIImage?
    var base64Data: String?
    var imageName: String?
}
