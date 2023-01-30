//
//  Bill+Extras.swift
//  BillManager
//

import Foundation
import UserNotifications

extension Bill {
    var hasReminder: Bool {
        return (remindDate != nil)
    }
    
    var isPaid: Bool {
        return (paidDate != nil)
    }
    
    var formattedDueDate: String {
        let dateString: String
        
        if let dueDate = self.dueDate {
            dateString = dueDate.formatted(date: .numeric, time: .omitted)
        } else {
            dateString = ""
        }
        
        return dateString
    }
    
    mutating func removeReminder() {
        if let id = notificationID {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
            notificationID = nil
            remindDate = nil
            
        }
    }
    
    mutating func schedulesReminders(date: Date, completion: @escaping (Bool) -> ()) {
        authorizationCheck { (granted) in
            guard granted else {
                DispatchQueue.main.async {
                    completion(false)
                }
                
                return
            }
            
        }
    
        let content = UNMutableNotificationContent()
        
        content.title = "Bills are coming"
        content.body = "Better get yo bank ready"
        content.sound = UNNotificationSound.defaultCritical
        
        let notificationTriggerComponents = Calendar.current.dateComponents([.day,.hour], from: date)
        
     //   let trigger = UNNotificationRequest(identifier: , content: <#T##UNNotificationContent#>, trigger: <#T##UNNotificationTrigger?#>)
        
    }
    
    
    
    private func authorizationCheck(completion: @escaping (Bool) -> ()) {
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                completion(true)
                
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.sound, .alert, .badge], completionHandler: {
                    (granted, _) in
                    completion(granted)
                })
            case .denied, .provisional, .ephemeral:
                completion(false)
            @unknown default:
                completion(false)
                
                
            }
        }
        
        
        
        
        
        
    }
    
    
}
