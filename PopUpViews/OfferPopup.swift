//
//  OfferPopup.swift
//  PopUp Test
//
//  Created by on 4/20/22.
//

import UIKit

class OfferPopup: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak private var pageControl: UIPageControl!
    @IBOutlet weak private var crossButton: UIButton!
    @IBOutlet weak private var offerCollectionView: UICollectionView!
    
    private var offerImgList: [String] = []
    
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
         Bundle.main.loadNibNamed("OfferPopup", owner: self, options: nil)
         contentView.frame = self.bounds
         contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
         
         contentView.makeViewBorderShadow(shadowOpacity: 0.8, shadowRadius: 12, cornerRadius: 8)
         addSubview(contentView)
         self.collectionViewSetup()
     }
    
    public func configure(images: [String]){
        crossButton.isHidden = false
        pageControl.isHidden = false
        pageControl.numberOfPages = images.count
        
        sliderSetup(images: images)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10 , execute: {
            self.removeFromSuperview()
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
        })
    }
    
    private func collectionViewSetup(){
        self.offerCollectionView.dataSource = self
        self.offerCollectionView.delegate = self
        let nibCell = UINib(nibName: WCOfferCollectionCell.identifier, bundle: nil)
        self.offerCollectionView.register(nibCell, forCellWithReuseIdentifier: WCOfferCollectionCell.identifier)
    }
    
    private func sliderSetup(images: [String]){
        self.offerImgList = images
        self.offerCollectionView.reloadData()
    }
    
    @IBAction private func crossPressed(_ sender: UIButton) {
        self.removeFromSuperview()
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
}

extension OfferPopup : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.bounds.width
        pageControl.currentPage = Int(page)
    }
}

//MARK: Collection View Functionalities
extension OfferPopup: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.offerImgList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WCOfferCollectionCell.identifier, for: indexPath) as! WCOfferCollectionCell
        
        let img = self.offerImgList[indexPath.row]
        cell.setImage(image: img)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width)
        return CGSize(width: width, height: width)
    }
}
