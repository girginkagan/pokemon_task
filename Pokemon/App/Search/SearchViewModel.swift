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
    let onError = BehaviorSubject<BaseErrorModel?>(value: nil)
    let onFavoriteStatus = BehaviorSubject<Bool?>(value: nil)
    private var collectionViewData: SearchResponseModel?
    let onCollectionViewDataSourceReady = BehaviorRelay<SearchCollectionViewSource?>(value: nil)
    let isCollectionViewDidScroll = BehaviorSubject<Bool>(value: false)
    
    init(services: RestClient) {
        self.services = services
    }
    
    func search(q: String) {
        services.searchPokemons(q: q) { [weak self] response in
            guard let self = self else { return }
            self.onCollectionViewDataSourceReady.accept(SearchCollectionViewSource(data: response, delegate: self))
        } errorCompletion: { [weak self] error in
            guard let self = self else { return }
            self.onCollectionViewDataSourceReady.accept(SearchCollectionViewSource(data: nil, delegate: self))
            self.onError.onNext(error)
        }
    }
    
    func favoriteItem(index: Int) {
        if let item = onCollectionViewDataSourceReady.value?.data?.cards?[index] {
            realmUtil.setData(data: item) { [weak self] added in
                self?.onFavoriteStatus.onNext(added)
            }
        } else {
            onError.onNext(BaseErrorModel(errorCode: nil, message: nil, errors: nil))
        }
    }
}

extension SearchViewModel: CollectionViewSourceDelegate {
    func onCollectionViewItemDidTap(item: Network.Card) {
        coordinator?.presentDetail(data: item)
    }
    
    func onCollectionViewDidScroll() {
        isCollectionViewDidScroll.onNext(true)
    }
}
