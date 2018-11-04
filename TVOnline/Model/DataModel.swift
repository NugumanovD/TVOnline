//
//  DataModel.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 11/2/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import Foundation

struct Welcome: Codable {
    let page, totalResults, totalPages: Int?
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case page
        
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

struct Result: Codable {
    
    let voteCount, id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String
    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String?
    let adult: Bool
    let overview, releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id, video
        case voteAverage = "vote_average"
        case title, popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case zh = "zh"
}

struct Company: Codable {
    var ivi = "IVI"
    var megogo = "MEGOGO"
    var amediateka = "Amediateka"
}

enum CodingKeys: String, Codable  {
    case ivi
    case megogo
    case amediateka
}









