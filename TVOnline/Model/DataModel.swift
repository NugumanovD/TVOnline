//
//  DataModel.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 11/2/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import Foundation

struct TheMovieDB: Codable {
    let page, totalResults, totalPages: Int?
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}















