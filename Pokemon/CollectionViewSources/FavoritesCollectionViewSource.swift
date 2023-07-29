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
    
    init(data: [Card]?) {
        self.data = data
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
}
