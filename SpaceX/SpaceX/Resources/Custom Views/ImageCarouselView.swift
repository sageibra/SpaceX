//
//  ImageCarouselView.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 11/11/2021.
//

import UIKit

final class ImageCarouselView: UIView {

    private let imagesStack = UIStackView()
    private let activityIndicator = UIActivityIndicatorView()
    private let scrollView = UIScrollView()
    private let pageControl = UIPageControl()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupImages(_ images: [UIImage]) {
        pageControl.numberOfPages = images.count
        images.forEach { image in
            imagesStack.addArrangedSubview(UIImageView(image: image))
        }

        activityIndicator.removeFromSuperview()
        imagesStack.arrangedSubviews.first?.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        imagesStack.setNeedsDisplay()
    }

    private func initialSetup() {
        backgroundColor = .secondarySystemBackground
        activityIndicator.startAnimating()

        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self

        imagesStack.spacing = 20
        imagesStack.distribution = .fillEqually

        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemRed

        [pageControl, scrollView, imagesStack].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        addSubview(scrollView)
        scrollView.addSubview(imagesStack)
        imagesStack.addArrangedSubview(activityIndicator)
        addSubview(pageControl)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            imagesStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imagesStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            imagesStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            imagesStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            imagesStack.heightAnchor.constraint(equalTo: scrollView.heightAnchor),

            activityIndicator.widthAnchor.constraint(equalTo: widthAnchor),

            pageControl.leadingAnchor.constraint(equalTo: leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: trailingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - UIScrollViewDelegate
extension ImageCarouselView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
        pageControl.currentPage = Int(scrollView.contentOffset.x / pageWidth)
    }
}
