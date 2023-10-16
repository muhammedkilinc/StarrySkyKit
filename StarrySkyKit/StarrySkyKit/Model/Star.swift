//
//  Star.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 16.10.2023.
//

import Foundation

enum StarColor: Codable, CaseIterable {
    case red, blue, green
}

enum StarBrightness: Codable, CaseIterable {
    case bright, normal
}

enum StarSize: Codable {
    case small, big
}

public struct Star: Codable {
    let size: StarSize
    let color: StarColor
    let brightness: StarBrightness
}
