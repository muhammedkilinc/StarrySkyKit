//
//  Star.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 16.10.2023.
//

import Foundation

enum StarColor: Codable, CaseIterable, CustomStringConvertible {
    case red, blue, green

    var description: String {
        switch self {
        case .red:
            "Red"
        case .blue:
            "Blue"
        case .green:
            "Green"
        }
    }
}

enum StarBrightness: Codable, CaseIterable, CustomStringConvertible {
    case bright, normal

    var description: String {
        switch self {
        case .bright:
            "Bright"
        case .normal:
            "Not so much"
        }
    }
}

enum StarSize: Codable, CustomStringConvertible {
    case small, big

    var description: String {
        switch self {
        case .small:
            "Small"
        case .big:
            "big"
        }
    }
}

public struct Star: Codable {
    let size: StarSize
    let color: StarColor
    let brightness: StarBrightness
}

extension Star: CustomStringConvertible {
    public var description: String {
        "size: \(size) - color: \(color) - bright: \(brightness)"
    }
}
