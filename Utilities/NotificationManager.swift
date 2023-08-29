//
//  NotificationManager.swift
//  WaltonWhilCloud
//
//  Created by Shahriar Mahmud on 11/17/21.
//

import Foundation

class NotificationManager {
    
    static let shared = NotificationManager()
    
    var numOfNotification = 0 {
        didSet {
            NotificationCenter.default.post(name: .updateNotificationBadge, object: nil)
        }
    }
    
    private init() {}
    
}
