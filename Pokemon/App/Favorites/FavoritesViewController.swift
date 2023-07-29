//
//  FavoritesViewController.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit
import RxSwift

final class FavoritesViewController: UIViewController, Storyboarded {
    static var storyboard = AppStoryboard.favorites
    var viewModel: FavoritesViewModel?
    private let disposeBag = DisposeBag()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        if tableView.dataSource != nil {
//            tableView.reloadData()
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        navigationItem.title = tabBarItem.title
    }
    
    private func setBindings() {
        guard let viewModel = viewModel else { return }
        
        
    }
    
}
