//
//  UINavigationController+PopBack.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import UIKit

extension UINavigationController {
    /// pop back to specific viewcontroller
    func popBack<T: UIViewController>(toViewController: T.Type) {
        let reversedVCs = viewControllers.reversed()
        for currentViewController in reversedVCs {
            if currentViewController .isKind(of: toViewController) {
                popToViewController(currentViewController, animated: true)
                break
            }
        }
    }
    
    /// pop back n viewcontroller
    func popBack(_ nb: Int) {
        guard viewControllers.count < nb else {
            popToViewController(viewControllers[viewControllers.count - nb], animated: true)
            return
        }
    }
    
    func removeVCFromStack<T: UIViewController>(_ vc:T.Type) {
        viewControllers.removeAll(where: {$0.isKind(of: vc)})
    }
    
    func removeAllFromVC(){
        viewControllers.removeAll()
    }
    
    func hideNavBar() {
        self.navigationBar.isHidden = true
    }
    
    func setupNavBarForLogin() {
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.view.backgroundColor = UIColor.clear
    }
    
    func removeNavBarBorder() {
        self.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.layoutIfNeeded()
    }
}

