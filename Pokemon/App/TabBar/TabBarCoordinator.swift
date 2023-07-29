//
//  TabBarCoordinator.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit

final class TabBarCoordinator: BaseCoordinator {
    private let viewModel: TabBarViewModel
    
    init(viewModel: TabBarViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        tabBarController.tabBar.barTintColor = Color.color_tabbar_bg.color
        tabBarController.tabBar.tintColor = Color.color_primary.color
        tabBarController.tabBar.unselectedItemTintColor = Color.AccentColor.color
        tabBarController.selectedIndex = 0
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = Color.color_tabbar_bg.color
        UITabBar.appearance().standardAppearance = tabBarAppearance

        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        
        if let searchCoordinator = AppDelegate.container.resolve(SearchCoordinator.self), let favoritesCoordinator = AppDelegate.container.resolve(FavoritesCoordinator.self) {
            start(coordinator: searchCoordinator)
            start(coordinator: favoritesCoordinator)
            
            tabBarController.viewControllers = [searchCoordinator.navigationController, favoritesCoordinator.navigationController]
        }
    }
}
