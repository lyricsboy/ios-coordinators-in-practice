//
//  Result.swift
//  CoordinatorsInPractice
//
//  Created by Brian Hardy on 9/20/17.
//  Copyright © 2017 Ponystyle Industries. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
