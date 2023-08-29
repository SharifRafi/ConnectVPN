//
//  CustomAlertPresenter.swift
//  WaltonWhilCloud
//
//  Created by Sharif Rafi on 21/11/22.
//

import UIKit

class CustomAlertPresenter: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var notificationTitleLbl: UILabel!
    @IBOutlet weak private var notificationBodyLbl: UILabel!
    @IBOutlet weak private var semiContainerView: UIView!
    @IBOutlet weak private var crossBtn: UIButton!
    @IBOutlet weak private var doneBtn: UIButton!
    @IBOutlet weak private var cancelBtn: UIButton!
    @IBOutlet weak private var cancelBtnContainerView: UIView!
    @IBOutlet weak private var titleLblHeightConstraint: NSLayoutConstraint!
    
    public var doneAction: (() -> Void)?
    public var cancelAction: (() -> Void)?
    
    //ICWaltonWelcomeBackground
    //ICplaceHolder
    
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
         Bundle.main.loadNibNamed("CustomAlertPresenter", owner: self, options: nil)
         contentView.frame = self.bounds
         contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
         semiContainerView.makeViewBorderShadow(shadowOpacity: 0.8, shadowRadius: 12, cornerRadius: 20)
         self.crossBtn.isHidden = true
         addSubview(contentView)
     }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
    }
    
    public func configure(title: String?, msg: String?, isSelfDismiss: Bool = false, alertType: AlertType){
        self.cancelBtnContainerView.isHidden = true
        if (title ?? "").isEmpty{
            self.titleLblHeightConstraint.constant = 0
        }
        if let title = title {
            notificationTitleLbl.text = title
        }
        if let body = msg {
            notificationBodyLbl.text = body
        }
        layoutIfNeeded()
        if isSelfDismiss{
            self.selfDismiss()
        }
        self.checkType(alertType: alertType)
    }
    
    public func configure(title: String?, msg: String?, isSelfDismiss: Bool = false, alertType: AlertType, result: @escaping () -> ()){
        self.cancelBtnContainerView.isHidden = true
        if (title ?? "").isEmpty{
            self.titleLblHeightConstraint.constant = 0
        }
        if let title = title {
            notificationTitleLbl.text = title
        }
        if let body = msg {
            notificationBodyLbl.text = body
        }
        layoutIfNeeded()
        if isSelfDismiss{
            self.selfDismiss()
        }
        self.checkType(alertType: alertType)
        self.doneAction = {
            result()
        }
    }
    
    public func configure(title: String?, msg: String?, isSelfDismiss: Bool = false, alertType: AlertType, doneResult: @escaping () -> (), cancelResult: @escaping () -> ()){
        if (title ?? "").isEmpty{
            self.titleLblHeightConstraint.constant = 0
        }
        if let title = title {
            notificationTitleLbl.text = title
        }
        if let body = msg {
            notificationBodyLbl.text = body
        }
        layoutIfNeeded()
        if isSelfDismiss{
            self.selfDismiss()
        }
        self.checkType(alertType: alertType)
        self.doneAction = {
            doneResult()
        }
        self.cancelAction = {
            cancelResult()
        }
    }
    
    private func checkType(alertType: AlertType){
        switch alertType {
        case .success:
            DLog("")
            self.imageView.image = UIImage(named: "ic_success")
            self.setDoneBtnTitleAndColor(color: .wcGreenButtonColor ?? .green, title: "OK")
        case .fail:
            DLog("")
            self.imageView.image = UIImage(named: "ic_error")
            self.setDoneBtnTitleAndColor(color: .wcJTStatusRed ?? .red, title: "OK")
        case .somethingWroong:
            DLog("")
            self.imageView.image = UIImage(named: "ic_somethingWrong")
            self.setDoneBtnTitleAndColor(color: .orange, title: "TRY AGAIN")
        }
    }
    
    private func setDoneBtnTitleAndColor(color: UIColor, title: String){
        self.doneBtn.backgroundColor = color
        self.doneBtn.setTitle(title, for: .normal)
    }
    
    @IBAction private func crossPressed(_ sender: UIButton) {
        self.removeFromSuperview()
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    @IBAction private func doneBtnAction(_ sender: UIButton) {
        self.removeFromSuperview()
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
        self.doneAction?()
    }
    
    @IBAction func cancelBtnAction(_ sender: UIButton) {self.removeFromSuperview()
        self.removeFromSuperview()
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
        self.cancelAction?()
    }
    
    private func selfDismiss(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5 , execute: {
            self.removeFromSuperview()
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
        })
    }
    
}
