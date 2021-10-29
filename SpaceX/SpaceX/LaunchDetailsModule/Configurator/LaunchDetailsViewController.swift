//
//  LaunchDetailsViewController.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 29/10/2021.
//

import UIKit

final class LaunchDetailsViewController: UIViewController, ModuleTransitionable {

    private let showArticle = UIButton()
    var output: LaunchDetailsViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewLoaded()
        setupViews()
        setupLayout()
    }

    private func setupViews() {
        title = output?.title
        view.backgroundColor = .systemBackground
        showArticle.setTitle("Article", for: .normal)
        showArticle.backgroundColor = .systemBlue
        showArticle.layer.cornerRadius = 12
        showArticle.addTarget(self, action: #selector(showArticleView), for: .touchUpInside)
    }

    private func setupLayout() {
        view.addSubview(showArticle)
        showArticle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            showArticle.heightAnchor.constraint(equalToConstant: 44),
            showArticle.widthAnchor.constraint(equalToConstant: 200),
            showArticle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showArticle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func showArticleView() {
        output?.presentWebView()
    }
}

// MARK: - View Input
extension LaunchDetailsViewController: LaunchDetailsViewInput {
    func reload() {}
}
