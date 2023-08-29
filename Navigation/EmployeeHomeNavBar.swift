//
//  EmployeeHomeNavBar.swift
//  WaltonWhilCloud
//
//  Created by Sharif Rafi on 22/8/22.
//

import UIKit
import SDWebImage

class EmployeeHomeNavBar: UIView {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak private var backBtn: UIButton!
    @IBOutlet weak private var titleLbl: UILabel!
    @IBOutlet weak private var profileImgView: UIImageView!
    
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
        
        let image = Helper.getStringData(key: Constants.wcName)
        self.backBtn.isHidden = false
        self.profileImgView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "ic_emptyProfileImg"))
        self.profileImgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToProfile)))
    }
    
    private func loadViewFromNib() -> UIView! {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func titleWithoutBackBtn(title: String) {
        self.titleLbl.text = title
        self.backBtn.isHidden = true
    }
    
    func titleWithBackBtn(title: String) {
        self.titleLbl.text = title
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
    
    @objc private func goToProfile(){
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
