//
//  SkyManager.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 16.10.2023.
//

import Foundation

protocol SkyManaging {
    func isSkyFull() -> Bool
    func addStar(size: StarSize)
    func resetStars()
}

final class SkyManager {
    private var stars: [Star] = []

    private let persistenceManager: PersistenceManaging
    private var lifecycleManager: AppLifecycleManaging
    private let notificationManager: NotificationManaging

    init(persistenceManager: PersistenceManaging,
         lifecycleManager: AppLifecycleManaging,
         notificationManager: NotificationManaging) {
        self.persistenceManager = persistenceManager
        self.lifecycleManager = lifecycleManager
        self.notificationManager = notificationManager

        setupLifecycleHooks()
        retriveStarsIfExist()
    }

    private func retriveStarsIfExist() {
        if let storedStars: [Star] = persistenceManager.load() {
            self.stars = storedStars
        }
    }

    private func printStars() {
        stars.forEach { item in
            print(item)
        }
        let brightStars = stars.filter { $0.brightness == .bright }.count
        print("Number of Bright stars: \(brightStars)")
    }

    private func setupLifecycleHooks() {
        lifecycleManager.didEnterBackground = { [weak self] in
            guard let self else {
                return
            }
            self.saveStars()
            self.notificationManager.scheduleStarsCountNotification(with: stars.count)
        }

        lifecycleManager.willTerminate = { [weak self] in
            guard let self else {
                return
            }
            self.notificationManager.removeStarsCountNotification()
        }
    }

    private func saveStars() {
        persistenceManager.save(stars)
    }
}

extension SkyManager: SkyManaging {
    func isSkyFull() -> Bool {
        stars.count >= 10
    }

    func addStar(size: StarSize) {
        guard let randomColor = StarColor.allCases.randomElement(),
              let randomBrightness = StarBrightness.allCases.randomElement() else {
            return
        }
        let star = Star(size: size, color: randomColor, brightness: randomBrightness)
        stars.append(star)
        printStars()
    }

    func resetStars() {
        stars.removeAll()
        printStars()
    }
}
