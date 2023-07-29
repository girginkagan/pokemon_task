//
//  FavoritesCollectionViewSource.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import Network
import UIKit

final class FavoritesCollectionViewSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let data: [Card]?
    let delegate: CollectionViewSourceDelegate?
    
    init(data: [Card]?, delegate: CollectionViewSourceDelegate?) {
        self.data = data
        self.delegate = delegate
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        cell.updateCell(imageUrl: data?[indexPath.row].imageURL ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: ((UIScreen.main.bounds.width - 30) / 2), height: ((UIScreen.main.bounds.width - 30) / 2) / 0.72) // ContentInsets: 10 - content - 10. 0.72 is the image ratio. Dividing by 2 because there are 2 columns on the screen
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let data = data else { fatalError() }
        
        delegate?.onCollectionViewItemDidTap(item: data[indexPath.row])
    }
}
