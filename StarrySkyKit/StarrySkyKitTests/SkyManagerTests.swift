//
//  SkyManagerTests.swift
//  StarrySkyKitTests
//
//  Created by Muhammed Kılınç on 17.10.2023.
//

import XCTest
@testable import StarrySkyKit

class SkyManagerTests: XCTestCase {

  var sut: SkyManager! // System Under Test
  var mockPersistenceManager: MockPersistenceManager!
  var mockAppLifecycleManager: MockAppLifecycleManager!

  override func setUp() {
    super.setUp()
    mockPersistenceManager = MockPersistenceManager()
    mockAppLifecycleManager = MockAppLifecycleManager()
    sut = SkyManager(
      persistenceManager: mockPersistenceManager,
      lifecycleManager: mockAppLifecycleManager)
  }

  override func tearDown() {
    mockPersistenceManager = nil
    mockAppLifecycleManager = nil
    sut = nil
    super.tearDown()
  }

  func testAddingStarIncreasesCount() {
    sut.addStar(size: .small)
    XCTAssertFalse(sut.isSkyFull())
  }

  func testSkyIsFullWhenAddingMoreThanLimit() {
    for _ in 1...11 {
      sut.addStar(size: .small)
    }
    XCTAssertTrue(sut.isSkyFull())
  }

  func testResetStarsClearsAllStars() {
    sut.addStar(size: .small)
    sut.resetStars()
    XCTAssertFalse(sut.isSkyFull())
  }

  func testStarsArePersistedWhenAppGoesToBackground() {
    sut.addStar(size: .small)
    mockAppLifecycleManager.didEnterBackground?()

    XCTAssertEqual(mockPersistenceManager.savedData!.count, 1)
  }

  func testStarsArePersistedWhenAppWillTerminate() {
    sut.addStar(size: .small)
    mockAppLifecycleManager.willTerminate?()

    XCTAssertEqual(mockPersistenceManager.savedData!.count, 1)
  }
}
