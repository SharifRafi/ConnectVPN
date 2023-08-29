//
//  WCOfferCollectionCell.swift
//  WaltonWhilCloud
//
//  Created by Sharif Rafi on 12/10/22.
//

import UIKit
import SDWebImage

class WCOfferCollectionCell: UICollectionViewCell {
    static let  identifier = "WCOfferCollectionCell"

    @IBOutlet weak private var offerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setImage(image: String){
        offerImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "ic_placeholder"))

    }
}
