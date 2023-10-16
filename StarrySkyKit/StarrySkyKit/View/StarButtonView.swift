//
//  StarButtonView.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 17.10.2023.
//

import UIKit

// MARK: - StarButtonViewDelegate

protocol StarButtonViewDelegate: AnyObject {
  func didTapSmallStarButton()
  func didTapBigStarButton()
  func didTapResetButton()
}

// MARK: - StarButtonView

final class StarButtonView: UIView {

  // MARK: Lifecycle

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  weak var delegate: StarButtonViewDelegate?

  // MARK: Private

  private lazy var smallStarButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle(Constants.smallStarTitle, for: .normal)
    button.backgroundColor = .blue
    return button
  }()

  private lazy var bigStarButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle(Constants.bigStarTitle, for: .normal)
    button.backgroundColor = .red
    return button
  }()

  private lazy var resetButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle(Constants.resetTitle, for: .normal)
    button.backgroundColor = .green
    return button
  }()

  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [smallStarButton, bigStarButton, resetButton])
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    return stackView
  }()

  private func setupViews() {
    addSubview(stackView)
    setupConstraints()

    smallStarButton.addTarget(self, action: #selector(handleSmallStarButtonTap), for: .touchUpInside)
    bigStarButton.addTarget(self, action: #selector(handleBigStarButtonTap), for: .touchUpInside)
    resetButton.addTarget(self, action: #selector(handleResetButtonTap), for: .touchUpInside)
  }

  private func setupConstraints() {
    let stackViewInsets = UIEdgeInsets(
      top: .zero,
      left: Constants.horizontalPadding,
      bottom: .zero,
      right: Constants.horizontalPadding)

    stackView.anchorToSuperview(with: stackViewInsets)
  }

  @objc
  private func handleSmallStarButtonTap() {
    delegate?.didTapSmallStarButton()
  }

  @objc
  private func handleBigStarButtonTap() {
    delegate?.didTapBigStarButton()
  }

  @objc
  private func handleResetButtonTap() {
    delegate?.didTapResetButton()
  }
}

// MARK: StarButtonView.Constants

extension StarButtonView {
  private enum Constants {
    static let smallStarTitle = "Small Star"
    static let bigStarTitle = "Big Star"
    static let resetTitle = "Reset"
    static let horizontalPadding: CGFloat = 10
  }
}
