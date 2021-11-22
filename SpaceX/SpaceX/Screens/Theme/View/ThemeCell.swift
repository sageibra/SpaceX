//
//  ThemeCell.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 18/11/2021.
//

import UIKit

final class ThemeCell: UITableViewCell {

    // MARK: - Outlets
    private let titleLabel = UILabel()

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
    }

    func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}

// MARK: - ThemeCellViewInput
extension ThemeCell: ThemeCellViewInput {
    func configure(with text: String) {
        titleLabel.text = text
    }
}
