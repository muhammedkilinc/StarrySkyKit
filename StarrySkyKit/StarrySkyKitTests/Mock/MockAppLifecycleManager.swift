//
//  MockAppLifecycleManager.swift
//  StarrySkyKitTests
//
//  Created by Muhammed Kılınç on 17.10.2023.
//

@testable import StarrySkyKit

class MockAppLifecycleManager: AppLifecycleManaging {
  var didEnterBackground: (() -> Void)?
  var willTerminate: (() -> Void)?
}
