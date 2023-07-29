//
//  Container+Services.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import Network
import Swinject
import SwinjectAutoregistration

extension Container {
    func registerServices() {
        autoregister(RestClient.self, initializer: RestClient.init).inObjectScope(.container)
    }
}
