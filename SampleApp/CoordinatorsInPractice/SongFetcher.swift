//
//  SongFetcher.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/20/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import Foundation

struct Song {
    let name: String
}

protocol SongFetcher {
    func fetchSongs(completion: ([Song]) -> Void)
}

protocol HasSongFetcher {
    var songFetcher: SongFetcher { get }
}

struct FakeSongFetcher: SongFetcher {
    func fetchSongs(completion: ([Song]) -> Void) {
        // TODO: maybe fetch some songs?
        completion([])
    }
}
