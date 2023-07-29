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
    let onCollectionViewDataSourceReady = BehaviorRelay<FavoritesCollectionViewSource?>(value: nil)
    let onError = BehaviorSubject<BaseErrorModel?>(value: nil)
    let onFavoriteStatus = BehaviorSubject<Bool?>(value: nil)
    
    init(services: RestClient) {
        self.services = services
    }
    
    func setCollectionView() {
        onCollectionViewDataSourceReady.accept(FavoritesCollectionViewSource(data: realmUtil.getData()))
    }
    
    func favoriteItem(index: Int) {
        if let item = onCollectionViewDataSourceReady.value?.data?[index] {
            realmUtil.setData(data: item) { [weak self] added in
                self?.onFavoriteStatus.onNext(added)
            }
        } else {
            onError.onNext(BaseErrorModel(errorCode: nil, message: nil, errors: nil))
        }
    }
}
