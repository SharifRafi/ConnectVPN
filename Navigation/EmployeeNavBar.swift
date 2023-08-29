//
//  EmployeeNavBar.swift
//  WaltonWhilCloud
//
//  Created by Sharif Rafi on 22/8/22.
//

import UIKit

class EmployeeNavBar: UIView {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak private var backBtn: UIButton!
    @IBOutlet weak private var titleLbl: UILabel!
    @IBOutlet weak private var profileBtn: UIButton!
    @IBOutlet weak private var secondBackBtn: UIButton!
    
    var logoutAction: (() -> Void)?
    var customBackAction: (() -> Void)?
    
    var contentView : UIView?
//    private var loginVM = WCLoginVM()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }

    private func xibSetup() {
        contentView = loadViewFromNib()
        contentView!.frame = bounds
        contentView!.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(contentView!)
        
        self.backBtn.isHidden = false
        self.secondBackBtn.isHidden = true
    }
    
    private func loadViewFromNib() -> UIView! {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func hideProfileBtn(){
        self.profileBtn.isHidden = true
    }
    
    func titleWithoutBackBtn(title: String) {
        self.titleLbl.text = title
        self.backBtn.isHidden = true
    }
    
    func handleUserInterection(){
        self.profileBtn.isUserInteractionEnabled = false
    }
    
    func titleWithBackBtn(title: String) {
        self.titleLbl.text = title
    }
    
    func hideProfileButton(){
        self.profileBtn.isHidden = true
    }

    @IBAction private func backAction(_ sender: UIButton) {
        guard let vc = self.window?.visibleViewController() else {return}
        transectionFromLeftToRight(vc: vc)
        if vc.navigationController == nil{
            vc.dismiss(animated: true)
        }else{
            vc.navigationController?.popViewController(animated: true)
        }
    }
    
    func secondBackBtnActivity(){
        self.backBtn.isHidden = true
        self.secondBackBtn.isHidden = false
    }
    
    @IBAction private func secondBackBtnAction(_ sender: UIButton) {
        self.customBackAction?()
    }
    
    @IBAction private func profileBtnAction(_ sender: Any) {
        self.goToProfile()
    }
    
    private func goToProfile(){
//        removeForgroundObserver()
//        let storyboard = UIStoryboard(storyboard: .profile)
//        let vc = storyboard.instantiateViewController(withIdentifier: WCEmployeeProfileVC.self)
//        let mwindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
//        guard let parentVC = mwindow?.visibleViewController() else {return}
//        parentVC.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func removeForgroundObserver(){
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
    }
}
