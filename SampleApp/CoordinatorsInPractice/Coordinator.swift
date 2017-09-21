//
//  Coordinator.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/20/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    
    var rootViewController: UIViewController { get }
    
    func addChildCoordinator(_ child: Coordinator)
    func removeChildCoordinator(_ child: Coordinator)
    func removeAllChildCoordinators()
    
    /// Implement to start flow-wide activities.
    func start()
    /// Implement to stop flow-wide activities.
    func stop()
}

class BaseCoordinator: NSObject, Coordinator {
    
    let rootViewController: UIViewController
    private var childCoordinators: [Coordinator]
    
    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
        childCoordinators = []
    }
    
    func start() {
        childCoordinators.forEach { $0.start() }
    }
    
    func stop() {
        childCoordinators.forEach { $0.stop() }
    }

    func addChildCoordinator(_ child: Coordinator) {
        childCoordinators.append(child)
    }
    
    func removeChildCoordinator(_ child: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== child }
    }
    
    func removeAllChildCoordinators() {
        childCoordinators = []
    }
    
}

