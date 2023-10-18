//
//  Anime.swift
//  Otaku V2
//
//  Created by The WORLD on 14.10.2023.
//

import UIKit

class Anime: Codable {
    var name: String
    var episodesCount: String
    var poster: URL
    var link: URL
    
    init(name: String, episodesCount: String, poster: URL, link: URL) {
        self.name = name
        self.episodesCount = episodesCount
        self.poster = poster
        self.link = link
    }
}
