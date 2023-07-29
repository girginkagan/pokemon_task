//
//  SystemIcon.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit

enum SystemIcon: String {
    case magnifyingglass
    case heart = "heart.fill"

    var image: UIImage? {
        return UIImage(systemName: self.rawValue)
    }
}
