//
//  StarView.swift
//  StarrySkyKit
//
//  Created by Muhammed Kılınç on 16.10.2023.
//

import UIKit
import WebKit

final class StarView: UIView {

    init(skyManager: SkyManaging) {
        self.skyManager = skyManager
        super.init(frame: .zero)
        setupViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    private lazy var starButtonView: StarButtonView = {
        let view = StarButtonView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var mainStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [webView, starButtonView])
        sv.axis = .vertical
        sv.distribution = .fill
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
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
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.leftAnchor.constraint(equalTo: leftAnchor),
            mainStackView.rightAnchor.constraint(equalTo: rightAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            starButtonView.heightAnchor.constraint(equalToConstant: 200)
        ])
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
        let alert = UIAlertController(title: String(),
                                      message: message,
                                      preferredStyle: .alert)

        alert.addAction(
            UIAlertAction(title: Constants.alertActionTitle,
                          style: .default,
                          handler: nil)
        )
        if let topVC = UIApplication.topViewController() {
            topVC.present(alert, animated: true, completion: nil)
        }
    }
}

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

extension StarView {
    enum Constants {
        static let urlString = "https://img.etimg.com/thumb/msid-72948091,width-650,imgsize-95069,,resizemode-4,quality-100/star_istock.jpg"
        static let alertActionTitle = "OK"
    }
}
