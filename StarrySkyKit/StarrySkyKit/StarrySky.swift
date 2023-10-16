//
//  StarrySky.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 16.10.2023.
//

import Foundation
import UIKit

public class StarrySky {

    // Singleton instance
    public static let shared = StarrySky()

    private let persistenceManager: PersistenceManaging
    private let lifecycleManager: AppLifecycleManaging
    private let notificationManager: NotificationManaging

    private lazy var starView: StarView = {
        StarView(skyManager: SkyManager(persistenceManager: persistenceManager,
                                        lifecycleManager: lifecycleManager,
                                        notificationManager: notificationManager))
    }()

    private init() {
        self.persistenceManager = PersistenceManager(storage: UserDefaults.standard,
                                                       encoder: JSONEncoder(),
                                                       decoder: JSONDecoder(),
                                                       key: Constants.starsKey)
        self.lifecycleManager = AppLifecycleManager()

        self.notificationManager = NotificationManager(notificationCenter: UNUserNotificationCenter.current())
    }

    public func addStarInterface(to parentView: UIView) {
        parentView.addSubview(starView)
        starView.anchorToSuperview()
    }

    public func requestNotificationPermission() {
        notificationManager.requestNotificationPermission()
    }
}
