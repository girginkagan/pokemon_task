//
//  UICollectionViewCell+identifier.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit

public extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self.self)
    }
}
