//
//  LibraryViewController.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/18/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import UIKit

enum MenuItem: CustomStringConvertible {
    case artists
    case albums
    case playlists
    
    var description: String {
        switch self {
        case .artists:
            return NSLocalizedString("Artists", comment: "")
        case .albums:
            return NSLocalizedString("Albums", comment: "")
        case .playlists:
            return NSLocalizedString("Playlists", comment: "")
        }
    }
}

protocol LibraryViewControllerDelegate: class {
    func libraryViewController(_ libraryViewController: LibraryViewController, didSelectMenuItem menuItem: MenuItem)
}

class LibraryViewController: UITableViewController, StoryboardInstantiable {
    static let storyboardName = "Main"
    
    let menuItems: [MenuItem] = [.artists, .albums, .playlists]
    
    weak var delegate: LibraryViewControllerDelegate?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        delegate?.libraryViewController(self, didSelectMenuItem: menuItem)
    }
}


