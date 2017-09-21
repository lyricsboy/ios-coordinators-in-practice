//
//  LibraryCoordinator.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/20/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import UIKit

class LibraryCoordinator: BaseCoordinator {
    
    let artistFetcher: ArtistFetcher
    let navigationController: UINavigationController
    
    init(artistFetcher: ArtistFetcher) {
        self.artistFetcher = artistFetcher
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
            artistsVC.configure(artistFetcher: artistFetcher)
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
