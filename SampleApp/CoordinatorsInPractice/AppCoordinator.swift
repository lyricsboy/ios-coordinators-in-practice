//
//  AppCoordinator.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/20/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    typealias Dependencies = HasArtistFetcher
    
    init(dependencies: Dependencies) {
        let libraryCoordinator = LibraryCoordinator(dependencies: dependencies)
        let forYouCoordinator = ForYouCoordinator()
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            libraryCoordinator.rootViewController,
            forYouCoordinator.rootViewController
        ]
        super.init(rootViewController: tabBarController)
        addChildCoordinator(libraryCoordinator)
        addChildCoordinator(forYouCoordinator)
    }
    
}
