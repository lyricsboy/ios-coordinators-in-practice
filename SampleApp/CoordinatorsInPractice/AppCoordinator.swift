//
//  AppCoordinator.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/20/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    init(artistFetcher: ArtistFetcher) {
        let libraryCoordinator = LibraryCoordinator(artistFetcher: artistFetcher)
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
