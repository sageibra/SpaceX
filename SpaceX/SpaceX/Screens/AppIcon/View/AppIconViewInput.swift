//
//  AppIconViewInput.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 17/11/2021.
//  Copyright © 2021 Chetech. All rights reserved.
//

import UIKit

protocol AppIconViewInput: AnyObject {
    func setupTableView()
    func reload()
}

protocol AppIconCellViewInput {
    func configure(with text: String, icon: UIImage)
}
