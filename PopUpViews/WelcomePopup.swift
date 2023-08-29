//
//  WelcomePopup.swift
//  PopUp Test
//
//  Created by on 4/20/22.
//

import UIKit
import SDWebImage

class WelcomePopup: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var welcomeMsg: UILabel!
    @IBOutlet weak private var distributorTypeLbl: UILabel!
    @IBOutlet weak private var semiContainerView: UIView!
    
    
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
         Bundle.main.loadNibNamed("WelcomePopup", owner: self, options: nil)
         contentView.frame = self.bounds
         contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
         semiContainerView.makeViewBorderShadow(shadowOpacity: 0.8, shadowRadius: 12, cornerRadius: 8)
         addSubview(contentView)
     }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        self.imageView.layer.cornerRadius = imageView.bounds.height / 2
    }
    
    public func configure(image: String?, name: String?, type: String?){
        if let image = image {
            imageView.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "ic_placeholder"))
        }
        
        if let name = name {
            welcomeMsg.text = "Congratulations " + name + "!"
        }
        
        if let type = type {
            distributorTypeLbl.text = "You are a \(type) Distributor of our Walton Group"
        }
        
        layoutIfNeeded()
        self.imageView.layer.cornerRadius = imageView.bounds.height / 2
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3 , execute: {
//            self.contentView.removeFromSuperview()
            self.removeFromSuperview()
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
        })
    }
}
