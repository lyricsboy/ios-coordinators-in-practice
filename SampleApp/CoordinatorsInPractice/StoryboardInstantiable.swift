//
//  StoryboardInstantiable.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/20/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import UIKit

/// Something which may be instantiated from a storyboard.
protocol StoryboardInstantiable {
    static var storyboardName: String { get }
    static var storyboardIdentifier: String { get }
}

extension StoryboardInstantiable where Self: UIViewController {
    
    static var storyboardIdentifier: String {
        return "\(self)" // default to the name of the class
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Failed to instantiate view controller from storyboard \(storyboardName) with identifier \(storyboardIdentifier) of type \(Self.self)")
        }
        return vc
    }
    
}

