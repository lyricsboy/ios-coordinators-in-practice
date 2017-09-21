//
//  ArtistFetcher.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/20/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import Foundation

struct Artist {
    let name: String
}

protocol ArtistFetcher {
    func fetchArtists(completion: (Result<[Artist]>) -> Void)
}

protocol HasArtistFetcher {
    var artistFetcher: ArtistFetcher { get }
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
