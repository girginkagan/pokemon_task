//
//  UICollectionView+register.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit

extension UICollectionView {
    func register(cell: UICollectionViewCell.Type) {
        let bundle = Bundle(for: cell.self)
        let nib = UINib(nibName: cell.identifier, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: cell.identifier)
    }
}
