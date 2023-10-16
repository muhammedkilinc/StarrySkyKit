//
//  StarrySky.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 16.10.2023.
//

import Foundation
import UIKit

public class StarrySky {

    // Singleton instance
    public static let shared = StarrySky()

    // The main view of the framework
    private lazy var starView: StarView = {
        let view = StarView(skyManager: SkyManager())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // Private initializer to ensure only one instance is created
    private init() {}

    // Public method to add the StarView
    public func addStarInterface(to parentView: UIView) {
        parentView.addSubview(starView)
        starView.anchorToSuperview()
    }
}
