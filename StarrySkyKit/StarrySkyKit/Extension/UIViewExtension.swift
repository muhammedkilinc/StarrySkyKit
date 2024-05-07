//
//  UIViewExtension.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 17.10.2023.
//

import UIKit

extension UIView {

  // Anchors view to all sides of its superview
  func anchorToSuperview(with insets: UIEdgeInsets = .zero) {
    guard let superview else { return }
    translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top),
      bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom),
      leftAnchor.constraint(equalTo: superview.leftAnchor, constant: insets.left),
      rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -insets.right),
    ])
  }

  // Sets specific width and height
  func setSize(width: CGFloat? = nil, height: CGFloat? = nil) {
    translatesAutoresizingMaskIntoConstraints = false

    if let width {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    if let height {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
  }
}
