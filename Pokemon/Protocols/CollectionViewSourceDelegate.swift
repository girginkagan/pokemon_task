//
//  CollectionViewSourceDelegate.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import Network

protocol CollectionViewSourceDelegate {
    func onCollectionViewDidScroll()
    func onCollectionViewItemDidTap(item: Card)
}
