//
//  SearchCollectionViewCell.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit
import Kingfisher

final class SearchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell(imageUrl: String) {
        imageView.kf.setImage(with: URL(string: imageUrl))
    }
}
