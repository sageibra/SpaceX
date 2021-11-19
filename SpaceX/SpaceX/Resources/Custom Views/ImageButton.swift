//
//  ImageButton.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 10/11/2021.
//

import UIKit

final class ImageButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(tintColor: UIColor = .label, icon: UIImage) {
        self.init(frame: .zero)
        self.tintColor = tintColor
        self.setImage(icon, for: .normal)
    }

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
