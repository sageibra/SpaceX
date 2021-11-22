//
//  SettingsCell.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 17/11/2021.
//

import UIKit

final class SettingsCell: UITableViewCell {

    // MARK: - Outlets
    private let titleLabel = UILabel()
    private let iconImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        accessoryType = .disclosureIndicator
        iconImageView.contentMode = .scaleAspectFit
    }

    func setupLayout() {
        [titleLabel, iconImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 26),
            iconImageView.widthAnchor.constraint(equalToConstant: 26),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),

            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}

// MARK: - SettingsCellViewInput
extension SettingsCell: SettingsCellViewInput {
    func configure(with text: String, icon: UIImage) {
        iconImageView.image = icon
        titleLabel.text = text
    }
}
