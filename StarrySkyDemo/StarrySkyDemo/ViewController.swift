//
//  ViewController.swift
//  StarrySkyDemo
//
//  Created by Muhammed Kılınç on 17.10.2023.
//

import UIKit
import StarrySkyKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        StarrySky.shared.addStarInterface(to: view)
    }
}

