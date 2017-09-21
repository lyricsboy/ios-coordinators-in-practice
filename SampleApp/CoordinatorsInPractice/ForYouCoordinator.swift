//
//  ForYouCoordinator.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/20/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import UIKit

class ForYouCoordinator: BaseCoordinator {
    
    init() {
        let forYouViewController = ForYouViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: forYouViewController)
        super.init(rootViewController: navigationController)
    }
}
