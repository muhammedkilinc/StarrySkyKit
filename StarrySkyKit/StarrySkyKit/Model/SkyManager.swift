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
