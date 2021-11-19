//
//  UITableView+Ext.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }

    func dequeue<T: UITableViewCell>(_: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(
            withIdentifier: String(describing: T.self), for: indexPath
        ) as! T // swiftlint:disable:this force_cast
    }
}
