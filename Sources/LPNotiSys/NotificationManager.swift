//
//  SwiftUIView 2.swift
//  
//
//  Created by 성재 on 7/2/24.
//

import SwiftUI
import Foundation
import UserNotifications

public class NotificationManager {
//    static let instance = NotificationManager()
    public init() {}
    
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
    
    func scheduleNotification() {
        let message = inquiryMessages.randomElement() ?? "Stay Curious"
        let content = UNMutableNotificationContent()
        content.title = "Docent"
        content.body = message
        content.sound = .default
        content.badge = 1
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()   // 초기화

        let datecomponent = DateComponents(hour: 10, minute: 00)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: datecomponent, repeats: true)
        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    
    let inquiryMessages = [
        "Did you know that curiosity is the key to learning?",
        "Exploring new ideas can lead to great discoveries!",
        "Keep asking questions, and you'll find the answers.",
        "Curiosity drives innovation. What's your next question?"
    ]
}
