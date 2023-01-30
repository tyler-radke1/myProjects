//
//  Alarm.swift
//  Alarm Walkthrough
//
//  Created by Tyler Radke on 1/27/23.
//

import Foundation
import UserNotifications

struct Alarm {
    
    private var notificationId: String
    
    var date: Date

    init(date: Date, notificationId: String? = nil) {
        self.date = date
        self.notificationId = notificationId ?? UUID().uuidString
    }
//    func schedule(completion: @escaping (Bool)) -> ()) {
//
//    }
    
    private func authorizeIfNeeded(completion: @escaping (Bool) -> ()) {
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                completion(true)
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound], completionHandler: <#T##(Bool, Error?) -> Void#>)
            }
        }
        
        
        
        
    }
    
    func unschedule() {
        
    }
   
    
}
