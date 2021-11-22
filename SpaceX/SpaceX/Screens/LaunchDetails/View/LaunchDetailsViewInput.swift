//
//  LaunchDetailsViewInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 16/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

protocol LaunchDetailsViewInput: AnyObject {
    func setupInitialState(with launch: Launch, result: Bool, date: String, resultInfo: String, details: String)
    func setupViews(with article: Bool, and wiki: Bool)
    func setupScrollView()
    func setupLayout()
    func setupScrollView(with images: [UIImage])
    func setupActions()
}
