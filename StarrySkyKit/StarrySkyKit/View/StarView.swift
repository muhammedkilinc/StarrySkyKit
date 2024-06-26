//
//  StarView.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 16.10.2023.
//

import UIKit
import WebKit

// MARK: - StarView

final class StarView: UIView {

  // MARK: Lifecycle

  init(skyManager: SkyManaging) {
    self.skyManager = skyManager
    super.init(frame: .zero)
    setupViews()
  }

  @available(*, unavailable)
  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Private

  private lazy var webView: WKWebView = {
    let webView = WKWebView()
    webView.backgroundColor = .gray
    return webView
  }()

  private lazy var starButtonView = StarButtonView()

  private lazy var mainStackView: UIStackView = {
    let sv = UIStackView(arrangedSubviews: [webView, starButtonView])
    sv.axis = .vertical
    sv.distribution = .fill
    sv.spacing = 10
    return sv
  }()

  private let skyManager: SkyManaging

  private func setupViews() {
    addSubview(mainStackView)
    setupConstraints()
    loadWebContent()
    starButtonView.delegate = self
  }

  private func setupConstraints() {
    let insets = UIEdgeInsets(
      top: 80,
      left: 20,
      bottom: 80,
      right: 20)
    mainStackView.anchorToSuperview(with: insets)
    starButtonView.setSize(height: 100)
  }

  private func loadWebContent() {
    if let url = URL(string: Constants.urlString) {
      let request = URLRequest(url: url)
      webView.load(request)
    }
  }

  private func addStar(with size: StarSize) {
    guard !skyManager.isSkyFull() else {
      showAlert(message: "Sky is full")
      return
    }
    skyManager.addStar(size: size)
  }

  private func showAlert(message: String) {
    let alert = UIAlertController(
      title: String(),
      message: message,
      preferredStyle: .alert)

    alert.addAction(
      UIAlertAction(
        title: Constants.alertActionTitle,
        style: .default,
        handler: nil))
    if let topVC = UIApplication.topViewController() {
      topVC.present(alert, animated: true, completion: nil)
    }
  }
}

// MARK: StarButtonViewDelegate

extension StarView: StarButtonViewDelegate {
  func didTapSmallStarButton() {
    addStar(with: .small)
  }

  func didTapBigStarButton() {
    addStar(with: .big)
  }

  func didTapResetButton() {
    skyManager.resetStars()
  }
}

// MARK: StarView.Constants

extension StarView {
  enum Constants {
    static let urlString =
      "https://img.etimg.com/thumb/msid-72948091,width-650,imgsize-95069,,resizemode-4,quality-100/star_istock.jpg"
    static let alertActionTitle = "OK"
  }
}
