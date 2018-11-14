//
//  Global.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 11/3/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import Foundation

enum Cell {
    static let identifierTableView = "tableView"
    static let identifierCollectionView = "collectionView"
}

enum Resource {
    static let mainURL = "https://api.themoviedb.org/3/movie/popular?api_key=6f6dff2efb177949eee7206b2f7203de&language=ru-Ru&page=1"
    static let imageURL = "https://image.tmdb.org/t/p/w300"
}

enum Global {
    static let url = "https://api.themoviedb.org/3/movie/popular?api_key="
    static let APIKey = "6f6dff2efb177949eee7206b2f7203de"
//    static let languageEng = "&language=en-US"
//    static let languageRus = "&language=ru-RU"
//    static let languageUA = "&language=ua-UA"
}

enum Language {
    static let ru = "&language=ru-RU"
    static let eng = "&language=en-US"
    static let ua = "&language=ua-UA"
}
