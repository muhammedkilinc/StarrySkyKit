//
//  PersistenceManager.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 17.10.2023.
//

import Foundation

protocol PersistenceManaging {
    func save<T: Encodable>(_ object: T)
    func load<T: Decodable>() -> T?
}

final class PersistenceManager {

    private let storage: UserDefaults
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    private let key: String

    init(storage: UserDefaults = UserDefaults.standard,
         encoder: JSONEncoder = JSONEncoder(),
         decoder: JSONDecoder = JSONDecoder(),
         key: String) {
        self.storage = storage
        self.encoder = encoder
        self.decoder = decoder
        self.key = key
    }
}

extension PersistenceManager: PersistenceManaging {
    func save<T: Encodable>(_ object: T) {
        do {
            let encodedData = try encoder.encode(object)
            storage.setValue(encodedData, forKey: key)
        } catch {
            print("Failed to save object:", error)
        }
    }

    func load<T: Decodable>() -> T? {
        do {
            if let savedData = storage.data(forKey: key) {
                return try decoder.decode(T.self, from: savedData)
            }
        } catch {
            print("Failed to load object:", error)
        }
        return nil
    }
}
