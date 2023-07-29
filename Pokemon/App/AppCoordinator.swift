//
//  AppCoordinator.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    override func start() {
        (UIApplication.shared.delegate as! AppDelegate).window = UIWindow(frame: UIScreen.main.bounds)
        (UIApplication.shared.delegate as! AppDelegate).window?.makeKeyAndVisible()
        presentHome()
    }
    
    func presentHome() {
        removeChildCoordinators()
        
        let coordinator = AppDelegate.container.resolve(TabBarCoordinator.self)!
        start(coordinator: coordinator)
        
        guard let window = (UIApplication.shared.delegate as! AppDelegate).window else { return }
        ViewControllerUtil.setRootViewController(
            window: window,
            viewController: coordinator.tabBarController,
            withAnimation: true)
    }
}
