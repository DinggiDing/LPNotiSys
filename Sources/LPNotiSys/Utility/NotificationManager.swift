//
//  SwiftUIView 2.swift
//  
//
//  Created by 성재 on 7/2/24.
//

import SwiftUI
import Foundation
import UserNotifications
import CryptoKit

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
        var message = MockData.bodytext[idx]
        switch idx {
        case 0:
            let randomIndex = generateRandomInt(maxValue: SentData.def.count)
            message = SentData.def[randomIndex]
        case 1:
            let randomIndex = generateRandomInt(maxValue: SentData.que.count)
            message = SentData.que[randomIndex]
        case 2:
            let randomIndex = generateRandomInt(maxValue: SentData.emo.count)
            message = SentData.emo[randomIndex]
        case 3:
            let randomIndex = generateRandomInt(maxValue: SentData.quo.count)
            message = SentData.quo[randomIndex]
        case 4:
            let randomIndex = generateRandomInt(maxValue: SentData.reg.count)
            message = SentData.reg[randomIndex]
        default:
            let randomIndex = generateRandomInt(maxValue: SentData.def.count)
            message = SentData.def[randomIndex]
        }

        let content = UNMutableNotificationContent()
        content.title = "1 Day Diary"
        content.body = message
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


    // 1. 현재 날짜와 시간을 문자열로 변환
    func getCurrentDateString() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return formatter.string(from: date)
    }

    // 2. 문자열을 해시 값으로 변환
    func sha256Hash(from string: String) -> Data {
        let inputData = Data(string.utf8)
        let hashed = SHA256.hash(data: inputData)
        return Data(hashed)
    }

    // 3. 해시 값을 정수로 변환
    func getRandomInt(from hashData: Data, maxValue: Int) -> Int {
        // 해시 데이터의 일부를 사용하여 정수를 생성
        let hashString = hashData.map { String(format: "%02hhx", $0) }.joined()
        let hashInt = UInt64(hashString.prefix(16), radix: 16) ?? 0
        return Int(hashInt % UInt64(maxValue))
    }

    // 4. 랜덤 정수 생성 함수
    func generateRandomInt(maxValue: Int) -> Int {
        let dateString = getCurrentDateString()
        let hashData = sha256Hash(from: dateString)
        let randomInt = getRandomInt(from: hashData, maxValue: maxValue)
        return randomInt
    }
}
