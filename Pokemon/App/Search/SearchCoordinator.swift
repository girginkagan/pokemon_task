//
//  SearchCoordinator.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit
import Network

final class SearchCoordinator: BaseCoordinator {
    private let viewModel: SearchViewModel
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = SearchViewController.instantiate()
        viewController.tabBarItem.title = "Search"
        viewController.tabBarItem.image = SystemIcon.magnifyingglass.image
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.tintColor = Color.AccentColor.color
        navigationController.navigationBar.barTintColor = Color.color_bg.color
        navigationController.viewControllers = [viewController]
    }
    
    func presentDetail(data: Card?) {
        guard let coordinator = AppDelegate.container.resolve(DetailCoordinator.self) else { fatalError("Did you forget to register your coordinator?") }
        coordinator.setData(data: data)
        startChild(coordinator: coordinator)
    }
}
