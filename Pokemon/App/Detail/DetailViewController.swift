//
//  DetailViewController.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit

final class DetailViewController: UIViewController, Storyboarded {
    static var storyboard = AppStoryboard.detail
    var viewModel: DetailViewModel?
    
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblArtist: UILabel!
    @IBOutlet private weak var ivItem: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    private func setUI() {
        navigationItem.title = tabBarItem.title
        
        ivItem.kf.setImage(with: URL(string: viewModel?.data?.imageURL ?? ""))
        lblArtist.text = "Artist: \(viewModel?.data?.artist ?? "")"
        lblName.text = "Name: \(viewModel?.data?.name ?? "")"
    }
}

