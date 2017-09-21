//
//  ArtistsViewController.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/18/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import UIKit

protocol ArtistsViewControllerDelegate: class {
    func artistsViewController(_ artistsViewController: ArtistsViewController, didSelectArtist artist: Artist)
}

class ArtistsViewController: UITableViewController, StoryboardInstantiable {
    static let storyboardName = "Main"
    
    weak var delegate: ArtistsViewControllerDelegate?
    
    private var artistFetcher: ArtistFetcher!
    
    private var artistsDataSource: ArtistsDataSource? {
        didSet {
            tableView.dataSource = artistsDataSource
        }
    }
    
    func configure(artistFetcher: ArtistFetcher) {
        self.artistFetcher = artistFetcher
    }
    
    override func viewDidLoad() {
        artistFetcher.fetchArtists { (artistsResult) in
            switch artistsResult {
            case .success(let artists):
                self.artistsDataSource = ArtistsDataSource(artists: artists)
            case .failure(let error):
                NSLog("Error: \(error)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let artist = artistsDataSource?.artists[indexPath.row] else {
            return
        }
        delegate?.artistsViewController(self, didSelectArtist: artist)
    }
}

class ArtistsDataSource: NSObject, UITableViewDataSource {
    
    let artists: [Artist]
    
    init(artists: [Artist]) {
        self.artists = artists
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistCell", for: indexPath)
        cell.textLabel?.text = artists[indexPath.row].name
        return cell
    }
}
