//
//  DetailCoordinator.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit
import Network

final class DetailCoordinator: BaseCoordinator {
    private let viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = DetailViewController.instantiate()
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func setData(data: Card?) {
        viewModel.data = data
    }
}
