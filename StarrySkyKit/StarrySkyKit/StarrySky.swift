//
//  StarrySky.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 16.10.2023.
//

import Foundation
import UIKit

public class StarrySky {

  // MARK: Lifecycle

  private init() {
    persistenceManager = PersistenceManager(
      storage: UserDefaults.standard,
      encoder: JSONEncoder(),
      decoder: JSONDecoder(),
      key: Constants.starsKey)
    lifecycleManager = AppLifecycleManager()

    notificationManager = NotificationManager(notificationCenter: UNUserNotificationCenter.current())
  }

  // MARK: Public

  // Singleton instance
  public static let shared = StarrySky()

  public func addStarInterface(to parentView: UIView) {
    parentView.addSubview(starView)
    starView.anchorToSuperview()
  }

  public func requestNotificationPermission() {
    notificationManager.requestNotificationPermission()
  }

  // MARK: Private

  private let persistenceManager: PersistenceManaging
  private let lifecycleManager: AppLifecycleManaging
  private let notificationManager: NotificationManaging

  private lazy var starView = StarView(skyManager: SkyManager(
    persistenceManager: persistenceManager,
    lifecycleManager: lifecycleManager,
    notificationManager: notificationManager))

}
