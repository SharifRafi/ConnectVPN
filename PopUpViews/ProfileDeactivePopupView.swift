//
//  ProfileDeactivePopupView.swift
//  WaltonWhilCloud
//
//  Created by Sharif Rafi on 20/10/22.
//

import UIKit
import SVProgressHUD

class ProfileDeactivePopupView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var notificationTitleLbl: UILabel!
    @IBOutlet weak private var notificationBodyLbl: UILabel!
    @IBOutlet weak private var semiContainerView: UIView!
    @IBOutlet weak private var crossBtn: UIButton!
    @IBOutlet weak private var confirmBtn: UIButton!
    @IBOutlet weak private var passFlowContainerView: UIView!
    @IBOutlet weak private var passLbl: UILabel!
    @IBOutlet weak private var passFld: UITextField!
    @IBOutlet weak private var passCancleBtn: UIButton!
    @IBOutlet weak private var passDeactivateBtn: UIButton!
    @IBOutlet weak private var passView: UIView!
    @IBOutlet weak private var passowrdLockImageView: UIImageView!
    
//    private let profileVM = WCProfileVM()
    private var isShowPassword = false
    
     override func awakeFromNib() {
         super.awakeFromNib()
         commonInit()
     }
     
     override init(frame: CGRect) {
         super.init(frame: frame)
         commonInit()
     }
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
     }
     
     fileprivate func commonInit(){
         Bundle.main.loadNibNamed("ProfileDeactivePopupView", owner: self, options: nil)
         self.contentView.frame = self.bounds
         self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
         self.passView.makeViewBorderStyle(cornerRadius: 4)
         self.semiContainerView.makeViewBorderShadow(shadowOpacity: 0.8, shadowRadius: 12, cornerRadius: 8)
         self.passFlowContainerView.makeViewBorderShadow(shadowOpacity: 0.8, shadowRadius: 12, cornerRadius: 8)
         self.passFlowContainerView.isHidden = true
         self.passowrdLockImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPasswordOnOff)))
         addSubview(contentView)
     }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
    }
    
    @IBAction private func crossPressed(_ sender: UIButton) {
        self.cancelAction()
    }
    
    @IBAction private func confirmBtnAction(_ sender: UIButton) {
        self.hideConfirmationView()
    }
    
    @IBAction private func passCancleBtnAction(_ sender: UIButton) {
        self.cancelAction()
    }
    
    @IBAction private func passDeactivateBtnAction(_ sender: UIButton) {
        self.CheckPassword()
    }
    
    private func cancelAction(){
        self.removeFromSuperview()
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    private func hideConfirmationView(){
        self.semiContainerView.isHidden = true
        self.passFlowContainerView.isHidden = false
    }
    
    func removeForgroundObserver(){
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    private func CheckPassword(){
        guard let pass = self.passFld.text else {return}
        
//        if self.profileVM.isValid(password: pass){
//            self.profileVM.checkPassword(password: pass) { success in
//                if (self.profileVM.checkformation?.message ?? false){
//                    self.deactiveAccAction()
//                }else{
//                    SVProgressHUD.dismiss()
//                    self.passFld.text?.removeAll()
//                    Helper.showCustomAlert(title: "Wrong Password!", msg: "Please Try Again", alertType: .somethingWroong)
//                }
//            }
//        }
    }
    
    private func deactiveAccAction(){
//        self.profileVM.setAccountDeactivate { success in
//            DLog("Successfully Deactivate")
//            if success{
//                self.removeForgroundObserver()
//                RootVCHelper.setToLoginVC()
//            }
//        }
    }
    
    @objc private func showPasswordOnOff(){
        if !isShowPassword{
            passowrdLockImageView.image = UIImage.init(named: "ic_password_unlock")
            isShowPassword = true
            self.passFld.isSecureTextEntry = false
        }else{
            passowrdLockImageView.image = UIImage.init(named: "ic_password_lock")
            isShowPassword = false
            self.passFld.isSecureTextEntry = true
        }
    }
}
