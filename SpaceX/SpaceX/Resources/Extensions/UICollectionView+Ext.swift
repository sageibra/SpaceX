//
//  UICollectionView+Ext.swift
//  SpaceX
//
//  Created by Ibragim Akaev on 28/10/2021.
//

import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }

    func dequeue<T: UICollectionViewCell>(_: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(
            withReuseIdentifier: String(describing: T.self), for: indexPath
        ) as! T // swiftlint:disable:this force_cast
    }
}
