//
//  NotificationManager.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 17.10.2023.
//

import Foundation
import UserNotifications

protocol NotificationManaging {
    func scheduleStarsCountNotification(with count: Int)
    func removeStarsCountNotification()
    func requestNotificationPermission()
}

final class NotificationManager: NotificationManaging {
    let notificationCenter: UNUserNotificationCenter
    
    init(notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()) {
        self.notificationCenter = notificationCenter
    }
    
    func requestNotificationPermission() {

        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification Permission granted")
            } else if let error = error {
                print("Permission denied: \(error)")
            }
        }
    }

    func scheduleStarsCountNotification(with count: Int) {
        let content = UNMutableNotificationContent()
        content.title = Constants.starsCountTitle
        content.body = "You have \(count) stars."

        let clearAction = UNNotificationAction(identifier: Constants.clearActionIdentifier,
                                               title: Constants.clearTitle,
                                               options: .destructive)

        let category = UNNotificationCategory(identifier: Constants.starsCategoryIdentifier,
                                              actions: [clearAction],
                                              intentIdentifiers: [],
                                              options: [])

        notificationCenter.setNotificationCategories([category])
        content.categoryIdentifier = Constants.categoryIdentifier

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        let request = UNNotificationRequest(identifier: Constants.starsNotificationIdentifier,
                                            content: content,
                                            trigger: trigger)
        notificationCenter.add(request)
    }

    func removeStarsCountNotification() {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: ["starsNotification"])
    }
}

extension NotificationManager {
    enum Constants {
        static let starsCountTitle = "Stars Count"
        static let starsNotificationIdentifier = "starsNotification"
        static let clearActionIdentifier = "clear"
        static let starsCategoryIdentifier = "starsCategory"
        static let categoryIdentifier = "starsCategory"
        static let clearTitle = "Clear Stars"
    }
}
