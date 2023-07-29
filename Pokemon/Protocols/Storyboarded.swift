//
//  Storyboarded.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

protocol Storyboarded {
    static var storyboard: AppStoryboard { get }
    static func instantiate() -> Self
}

extension Storyboarded {
    static func instantiate() -> Self {
        let identifier = String(describing: self)
        switch identifier {
        case AppStoryboard.favorites.rawValue:
            let viewController = FavoritesViewController(nibName: identifier, bundle: nil) as! Self
            return viewController
        case AppStoryboard.search.rawValue:
            let viewController = SearchViewController(nibName: identifier, bundle: nil) as! Self
            return viewController
        default:
            fatalError("No viewcontroller passed.")
        }
    }
}
