//
//  AppIconCell.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 17/11/2021.
//

import UIKit

final class AppIconCell: UITableViewCell {

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

    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }

    func setupViews() {
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.layer.cornerRadius = 4
        iconImageView.clipsToBounds = true
    }

    func setupLayout() {
        [titleLabel, iconImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}

// MARK: - SettingsCellViewInput
extension AppIconCell: AppIconCellViewInput {
    func configure(with text: String, icon: UIImage) {
        iconImageView.image = icon
        titleLabel.text = text
    }
}
