//
//  AppDelegate.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/15/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import UIKit

struct AppDependencies: HasArtistFetcher {
    let artistFetcher: ArtistFetcher
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let artistFetcher = FakeArtistFetcher()
        let appDependencies = AppDependencies(artistFetcher: artistFetcher)
        appCoordinator = AppCoordinator(dependencies: appDependencies)
        
        let window = UIWindow()
        window.rootViewController = appCoordinator.rootViewController
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

}

