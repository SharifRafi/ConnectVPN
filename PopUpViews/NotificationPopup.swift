//
//  NotificationPopup.swift
//  WaltonWhilCloud
//
//  Created by Sharif Rafi on 30/8/22.
//

import UIKit

class NotificationPopup: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak private var notificationTitleLbl: UILabel!
    @IBOutlet weak private var notificationBodyLbl: UILabel!
    @IBOutlet weak private var semiContainerView: UIView!
    @IBOutlet weak private var crossBtn: UIButton!
    
    
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
         Bundle.main.loadNibNamed("NotificationPopup", owner: self, options: nil)
         contentView.frame = self.bounds
         contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
         semiContainerView.makeViewBorderShadow(shadowOpacity: 0.8, shadowRadius: 12, cornerRadius: 8)
         self.crossBtn.setTitle("", for: .normal)
         addSubview(contentView)
     }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
    }
    
    public func configure(title: String?, body: String?, isSelfDismiss: Bool = true){
       
        if let title = title {
            notificationTitleLbl.text = title
        }
        
        if let body = body {
            notificationBodyLbl.text = body
        }
        
        layoutIfNeeded()
        
        if isSelfDismiss{
            DispatchQueue.main.asyncAfter(deadline: .now() + 5 , execute: {
                self.removeFromSuperview()
                UIView.animate(withDuration: 0.3) {
                    self.layoutIfNeeded()
                }
            })
        }
    }
    
    @IBAction private func crossPressed(_ sender: UIButton) {
        self.removeFromSuperview()
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
}
