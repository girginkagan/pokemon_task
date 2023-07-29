//
//  Color.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit

enum Color: String {
    case color_primary
    case color_tabbar_bg
    case AccentColor
    case color_bg

    var color: UIColor? {
        return UIColor(named: self.rawValue)
    }
}
