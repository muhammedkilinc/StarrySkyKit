//
//  MockPersistenceManager.swift
//  StarrySkyKitTests
//
//  Created by Muhammed Kılınç on 17.10.2023.
//

@testable import StarrySkyKit

class MockPersistenceManager: PersistenceManaging {
  var savedData: [Star]?

  func save(_ object: some Encodable) {
    savedData = object as? [Star]
  }

  func load<T: Decodable>() -> T? {
    savedData as? T
  }
}
