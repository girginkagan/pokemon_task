//
//  AppDelegate.swift
//  Pokemon
//
//  Created by Kagan Girgin on 7/29/23.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appCoordinator: AppCoordinator!
    static let container = Container()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AppDelegate.container.registerDependencies()
        
        appCoordinator = AppDelegate.container.resolve(AppCoordinator.self)!
        appCoordinator.start()
        
        return true
    }
}

