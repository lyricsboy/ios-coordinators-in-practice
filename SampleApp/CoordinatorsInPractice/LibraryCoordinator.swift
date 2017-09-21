//
//  LibraryCoordinator.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/20/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import UIKit

class LibraryCoordinator: BaseCoordinator {
    
    typealias Dependencies = HasArtistFetcher & HasSongFetcher
    let dependencies: Dependencies
    
    let navigationController: UINavigationController
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        let libraryVC = LibraryViewController.instantiate()
        navigationController = UINavigationController(rootViewController: libraryVC)
        super.init(rootViewController: navigationController)
        libraryVC.delegate = self
    }
}

extension LibraryCoordinator: LibraryViewControllerDelegate {
    
    func libraryViewController(_ libraryViewController: LibraryViewController, didSelectMenuItem menuItem: MenuItem) {
        // push the proper view controller for this menu item
        switch menuItem {
        case .artists:
            let artistsVC = ArtistsViewController.instantiate()
            artistsVC.configure(dependencies: dependencies)
            artistsVC.delegate = self
            navigationController.pushViewController(artistsVC, animated: true)
        default:
            fatalError("not implemented")
        }
    }
}

extension LibraryCoordinator: ArtistsViewControllerDelegate {
    
    func artistsViewController(_ artistsViewController: ArtistsViewController, didSelectArtist artist: Artist) {
        NSLog("You selected \(artist.name)")
    }
}
