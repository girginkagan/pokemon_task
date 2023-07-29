//
//  Container+ViewModels.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import Swinject
import SwinjectAutoregistration

extension Container {
    func registerViewModels() {
        autoregister(SearchViewModel.self, initializer: SearchViewModel.init)
        autoregister(TabBarViewModel.self, initializer: TabBarViewModel.init)
        autoregister(FavoritesViewModel.self, initializer: FavoritesViewModel.init)
    }
}
