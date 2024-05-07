//
//  Star.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 16.10.2023.
//

import Foundation

// MARK: - StarColor

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

// MARK: - StarBrightness

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

// MARK: - StarSize

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

// MARK: - Star

public struct Star: Codable {
  let size: StarSize
  let color: StarColor
  let brightness: StarBrightness
}

// MARK: CustomStringConvertible

extension Star: CustomStringConvertible {
  public var description: String {
    "size: \(size) - color: \(color) - bright: \(brightness)"
  }
}
