//
//  Container+Coordinators.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerCoordinators() {
        autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        autoregister(SearchCoordinator.self, initializer: SearchCoordinator.init)
        autoregister(FavoritesCoordinator.self, initializer: FavoritesCoordinator.init)
        autoregister(TabBarCoordinator.self, initializer: TabBarCoordinator.init)
        autoregister(DetailCoordinator.self, initializer: DetailCoordinator.init)
    }
}
