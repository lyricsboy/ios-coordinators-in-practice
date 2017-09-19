//
//  LibraryViewController.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/18/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import UIKit

class LibraryViewController: UITableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let artistsVC = segue.destination as? ArtistsViewController {
            artistsVC.configure(artistFetcher: FakeArtistFetcher())
        }
    }
}

struct FakeArtistFetcher: ArtistFetcher {
    
    func fetchArtists(completion: (Result<[Artist]>) -> Void) {
        let artists = [
            "The Beatles",
            "The Doors",
            "The Police",
            "The Who",
            ].map { Artist(name: $0) }
        completion(.success(artists))
    }
}
