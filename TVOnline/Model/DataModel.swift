//
//  DataModel.swift
//  TVOnline
//
//  Created by Nugumanov Dmitry on 11/2/18.
//  Copyright © 2018 Nugumanov Dmitry. All rights reserved.
//

import Foundation

struct ModelList {
    var nameResource: String
    var films: [FilmsList]
}

struct FilmsList {
    var nameCinema: String
    var dateCinema: String
    var posterCinema: String
}

let ivi = ModelList(nameResource: "IVI", films: [
    FilmsList(nameCinema: "22 Мили", dateCinema: "2018", posterCinema: "22miles"),
    FilmsList(nameCinema: "Альфа", dateCinema: "2018", posterCinema: "alfa"),
    FilmsList(nameCinema: "Великий Уравнитель 2", dateCinema: "2018", posterCinema: "grand"),
    FilmsList(nameCinema: "Аксель", dateCinema: "2018", posterCinema: "axl")])

let megogo = ModelList(nameResource: "MEGOGO", films: [
    FilmsList(nameCinema: "Хищник", dateCinema: "2018", posterCinema: "hishnik"),
    FilmsList(nameCinema: "Meg", dateCinema: "2018", posterCinema: "meg"),
    FilmsList(nameCinema: "Мстители", dateCinema: "2018", posterCinema: "mstiteli"),
    FilmsList(nameCinema: "Черная Пантера", dateCinema: "2018", posterCinema: "panther")])

let amediateka = ModelList(nameResource: "Amediateka", films: [
    FilmsList(nameCinema: "Небоскреб", dateCinema: "2018", posterCinema: "neboscreb"),
    FilmsList(nameCinema: "Ночь", dateCinema: "2018", posterCinema: "night"),
    FilmsList(nameCinema: "Веном", dateCinema: "2018", posterCinema: "venom"),
    FilmsList(nameCinema: "Охотник", dateCinema: "2018", posterCinema: "hunter")])

let infoList = [ivi, megogo, amediateka]
