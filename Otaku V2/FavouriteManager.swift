//
//  FavouriteManager.swift
//  Otaku V2
//
//  Created by The WORLD on 17.10.2023.
//

import Foundation

final class FavouriteManager {
    private static let userDefaults = UserDefaults.standard
    private static let key = "FavouriteAnime"
    
    static func saveData(animeList: [Anime]) {
        let encoder = JSONEncoder()
        if let encodedAnimeList = try? encoder.encode(animeList) {
            userDefaults.set(encodedAnimeList, forKey: key)
        }
    }
    
    
    static func loadData() -> [Anime] {
        if let savedData = userDefaults.data(forKey: key) {
            let decoder = JSONDecoder()
            if let loadAnimeList = try? decoder.decode([Anime].self, from: savedData) {
                return loadAnimeList
            }
        }
        return []
    }
}
