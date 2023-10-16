//
//  AppLifecycleManager.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 17.10.2023.
//

import UIKit

final class AppLifecycleManager {

    var didEnterBackground: (() -> Void)?
    var willTerminate: (() -> Void)?

    init() {
        setupNotifications()
    }

    private func setupNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleAppDidEnterBackground),
                                               name: UIApplication.didEnterBackgroundNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleAppWillTerminate),
                                               name: UIApplication.willTerminateNotification,
                                               object: nil)
    }

    @objc private func handleAppDidEnterBackground() {
        didEnterBackground?()
    }

    @objc private func handleAppWillTerminate() {
        willTerminate?()
    }
}
