//
//  SearchViewController.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit
import RxSwift
import RxGesture

final class SearchViewController: UIViewController, Storyboarded {
    static var storyboard = AppStoryboard.search
    var viewModel: SearchViewModel?
    private let disposeBag = DisposeBag()
    
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if collectionView.dataSource != nil {
            collectionView.collectionViewLayout.invalidateLayout()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setBindings()
    }
    
    private func setUI() {
        navigationItem.title = tabBarItem.title
        
        collectionView.register(cell: SearchCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        
        collectionView
            .rx.longPressGesture()
            .when(.began)
            .bind { [weak self] gestureRecognizer in
                if (gestureRecognizer.state != .began) { return }
                let location = gestureRecognizer.location(in: self?.collectionView)
                if let indexPath = self?.collectionView?.indexPathForItem(at: location) {
                    self?.viewModel?.favoriteItem(index: indexPath.row)
                }
            }
            .disposed(by: disposeBag)
    }
    
    private func setBindings() {
        guard let viewModel = viewModel else { return }
        
        searchBar
            .rx.text
            .orEmpty
            .debounce(.milliseconds(1000), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { $0.count > 1 }.bind { [weak self] val in
                self?.viewModel?.search(q: val.description)
            }
            .disposed(by: disposeBag)
        
        viewModel
            .onError
            .bind { [weak self] data in
            if let errorData = data {
                guard let self = self else { return }
                AlertUtil.showStandardAlert(parentController: self, title: "Error", message: errorData.message ?? "An unknown error has occured.")
            }
        }.disposed(by: disposeBag)
        
        viewModel
            .onFavoriteStatus
            .bind (onNext: { [weak self] data in
            if let status = data {
                guard let self = self else { return }
                if status {
                    AlertUtil.showStandardAlert(parentController: self, title: "Success", message: "Item has been marked as favorite.")
                } else {
                    AlertUtil.showStandardAlert(parentController: self, title: "Success", message: "Item has been removed from the favorite list.")
                }
            }
        }).disposed(by: disposeBag)
        
        viewModel
            .onCollectionViewDataSourceReady
            .bind { [weak self] data in
            if let source = data {
                self?.collectionView.dataSource = source
                self?.collectionView.delegate = source
                self?.collectionView.reloadData()
            }
        }.disposed(by: disposeBag)
        
        viewModel
            .isCollectionViewDidScroll
            .bind { [weak self] data in
                if data {
                    self?.searchBar.endEditing(true)
                }
        }.disposed(by: disposeBag)
    }
}

extension SearchViewController: UISearchBarDelegate { }
