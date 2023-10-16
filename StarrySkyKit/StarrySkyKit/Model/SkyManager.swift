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

    private func printStars() {
        print(stars)
        let brightStars = stars.filter { $0.brightness == .bright }.count
        print("Number of Bright stars: \(brightStars)")
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
