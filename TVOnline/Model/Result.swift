//
//  Result.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 11/7/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import Foundation

struct Result: Codable {
    
    let voteCount, id: Int?
    let video: Bool?
    let voteAverage: Double?
    let title: String
    let popularity: Double?
    let posterPath: String
    let originalTitle: String?
    let genreIDS: [Int]?
    let backdropPath: String?
    let adult: Bool?
    let overview, releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id, video
        case voteAverage = "vote_average"
        case title, popularity
        case posterPath = "poster_path"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
}
