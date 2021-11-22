//
//  PaddingLabel.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 09/11/2021.
//

import UIKit

final class PaddingLabel: UILabel {

    private let topInset: CGFloat = 5.0
    private let bottomInset: CGFloat = 5.0
    private let leftInset: CGFloat = 7.0
    private let rightInset: CGFloat = 7.0

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    convenience init(fontSize: CGFloat, backgroundColor: UIColor = .systemGray5) {
        self.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .heavy)
        self.backgroundColor = backgroundColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }

    private func configure() {
        textColor = .label
        layer.cornerRadius = 4
        clipsToBounds = true
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
