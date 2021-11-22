//
//  CustomNavBar.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 10/11/2021.
//

import UIKit

final class CustomNavBar: UIView {

    var closeButton = ImageButton(tintColor: .secondaryLabel, icon: Images.close)
    var titleLabel = TitleLabel(fontSize: 28)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBlurEffect()
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubviews(titleLabel, closeButton)
        translatesAutoresizingMaskIntoConstraints = false

        closeButton.contentHorizontalAlignment = .fill
        closeButton.contentVerticalAlignment = .fill

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -10),

            closeButton.heightAnchor.constraint(equalToConstant: 29),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }

    private func setupBlurEffect() {
        backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(blurView, at: 0)

        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.heightAnchor.constraint(equalTo: heightAnchor),
            blurView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
