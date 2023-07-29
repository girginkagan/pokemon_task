//
//  FavoritesViewModel.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import Network
import RxSwift
import RxCocoa

final class FavoritesViewModel: BaseViewModel {
    private let services: RestClient
    var coordinator: FavoritesCoordinator?
    private let disposeBag = DisposeBag()
    
    init(services: RestClient) {
        self.services = services
    }
    
    func setBindings() {
        
    }
}
