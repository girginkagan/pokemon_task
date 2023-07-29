//
//  Container+registerDependencies.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import Swinject

extension Container {
    func registerDependencies() {
        registerCoordinators()
        registerViewModels()
        registerServices()
    }
}
