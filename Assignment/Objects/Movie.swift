//
//  Movie.swift
//  Assignment
//
//  Created by Ran Loock on 17/02/2019.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation
struct MovieObj: Codable {
    let title: String
    let image: String
    let rating: Float
    let releaseYear: Int16
    let genre: [String]
    
}
