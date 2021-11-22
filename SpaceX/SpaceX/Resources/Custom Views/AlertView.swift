//
//  AlertView.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 22/11/2021.
//

import UIKit

final class AlertView: UIView {
    private let containerView = UIView()
    private let actionButton = UIButton()
    let titleLabel = TitleLabel(fontSize: 20, fontWeight: .medium)
    let messageLabel = SubTitleLabel(fontSize: 16)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = UIColor.black.withAlphaComponent(0.75)
        actionButton.setTitle("Ok", for: .normal)
        actionButton.backgroundColor = .systemPink
        actionButton.layer.cornerRadius = 8

        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor

        messageLabel.numberOfLines = 0
        [titleLabel, messageLabel].forEach { $0.textAlignment = .center }
        actionButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
    }

    private func setupLayout() {
        let padding: CGFloat = 20

        [containerView, titleLabel, actionButton, messageLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),

            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),

            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44),

            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }

    @objc private func okButtonTapped() {
        removeFromSuperview()
    }
}
