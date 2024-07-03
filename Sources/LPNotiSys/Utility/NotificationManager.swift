//
//  SwiftUIView 2.swift
//  
//
//  Created by 성재 on 7/2/24.
//

import SwiftUI
import Foundation
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()
    private init() {}
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification(idx: Int) {
//        let randomIndex = Int.random(in: 0..<inquiryMessages.count)
//        let message = inquiryMessages[randomIndex]
        let message = Gettxt.readTextFile(name: MockData.type_en[idx])
        let content = UNMutableNotificationContent()
        content.title = "1 Day Diary"
        content.body = message ?? MockData.bodytext[idx]
        content.sound = .default
        content.badge = 1
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()   // 초기화

        let datecomponent = DateComponents(hour: 10, minute: 00)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: datecomponent, repeats: true)
        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 70, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
