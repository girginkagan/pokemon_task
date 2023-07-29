//
//  DetailViewModel.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import Network

final class DetailViewModel: BaseViewModel {
    private let services: RestClient
    var coordinator: DetailCoordinator?
    var data: Card?
    
    init(services: RestClient) {
        self.services = services
    }
}
