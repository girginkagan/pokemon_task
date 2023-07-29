//
//  FavoritesCoordinator.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit

final class FavoritesCoordinator: BaseCoordinator {
    private let viewModel: FavoritesViewModel
    
    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = FavoritesViewController.instantiate()
        viewController.tabBarItem.title = "Favorites"
        viewController.tabBarItem.image = SystemIcon.heart.image
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.tintColor = Color.AccentColor.color
        navigationController.navigationBar.barTintColor = Color.color_bg.color
        navigationController.viewControllers = [viewController]
    }
    
}
