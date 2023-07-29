//
//  SearchViewModel.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import Network
import RxSwift
import RxCocoa

final class SearchViewModel: BaseViewModel {
    private let services: RestClient
    var coordinator: SearchCoordinator?
    private let disposeBag = DisposeBag()
    
    init(services: RestClient) {
        self.services = services
    }
}
