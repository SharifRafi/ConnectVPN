//
//  UIViewController+Reload.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import UIKit
//import Firebase

extension UIViewController {
    func reloadViewFromNib() {
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view) // This line causes the view to be reloaded
    }
    
    func hideNavigationBar(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setNavigationBackBtnStyle(){
        if #available(iOS 13.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                self.navigationController?.navigationBar.tintColor = UIColor.white
            } else {
                self.navigationController?.navigationBar.tintColor = UIColor.systemBlue
            }
        } else {
            self.navigationController?.navigationBar.tintColor = UIColor.systemBlue
        }
    }
    
    func showNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func darkMode(textField:UITextField){
        if #available(iOS 12.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                // User Interface is Dark
                textField.textColor = UIColor.black
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    func transectionFromBottomToTop()-> CATransition{
        let transition = CATransition()
         transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        return transition
    }
    
    func setTabCartCount(){
        if let tabItems = tabBarController?.tabBar.items {
            // In this case we want to modify the badge number of the third tab:
            let tabItem = tabItems[1]
            tabItem.badgeValue = NotificationManager.shared.numOfNotification == 0 ? nil : String(NotificationManager.shared.numOfNotification)
        }
    }
}

extension UIViewController{
    func transectionFromLeftToRight(vc: UIViewController){
        let transition = CATransition()
            transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
        vc.navigationController?.view.layer.add(transition, forKey: nil)
    }
}
