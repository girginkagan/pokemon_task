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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setBindings()
    }
    
    private func setUI() {
        navigationItem.title = tabBarItem.title
        
    }
    
    private func setBindings() {
        guard let viewModel = viewModel else { return }
        
    }
}

extension SearchViewController: UISearchBarDelegate { }
