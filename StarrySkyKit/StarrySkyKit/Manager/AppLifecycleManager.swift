//
//  AppLifecycleManager.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 17.10.2023.
//

import UIKit

// MARK: - AppLifecycleManaging

protocol AppLifecycleManaging {
  var didEnterBackground: (() -> Void)? { get set }
  var willTerminate: (() -> Void)? { get set }
}

// MARK: - AppLifecycleManager

final class AppLifecycleManager {

  // MARK: Lifecycle

  init() {
    setupNotifications()
  }

  // MARK: Internal

  var didEnterBackground: (() -> Void)?
  var willTerminate: (() -> Void)?

  // MARK: Private

  private func setupNotifications() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(handleAppDidEnterBackground),
      name: UIApplication.didEnterBackgroundNotification,
      object: nil)

    NotificationCenter.default.addObserver(
      self,
      selector: #selector(handleAppWillTerminate),
      name: UIApplication.didBecomeActiveNotification,
      object: nil)
  }

  @objc
  private func handleAppDidEnterBackground() {
    didEnterBackground?()
  }

  @objc
  private func handleAppWillTerminate() {
    willTerminate?()
  }
}

// MARK: AppLifecycleManaging

extension AppLifecycleManager: AppLifecycleManaging { }
