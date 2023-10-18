//
//  Parser.swift
//  Otaku V2
//
//  Created by The WORLD on 16.10.2023.
//
import Foundation
import Alamofire
import Kanna

func getAnime(from url: String, completion: @escaping ([Anime]?) -> Void) {
    var animeList: [Anime] = []
    var link: URL!

    AF.request(url).responseData { response in
        if let error = response.error {
            print("Error: \(error)")
            completion(nil) // Если возникла ошибка, передайте nil в замыкание
            return
        }

        if let doc = try? HTML(html: response.data!, encoding: .windowsCP1251) {
            for animeListElement in doc.css(".all_anime_global") {
                if let animeName = animeListElement.at_css(".aaname")?.text,
                   var animeLink = animeListElement.at_css("a")?["href"],
                   var animeSeries = animeListElement.at_css(".aailines")?.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                   let imgLink = animeListElement.at_css(".all_anime_image")?["style"]?.components(separatedBy: "'")[1] {
                    
                    animeLink = animeLink.replacingOccurrences(of: "/", with: "")
                    animeLink = "https://jut.su/\(animeLink)"
                    link = URL(string: animeLink)
                    
                    animeSeries = animeSeries.replacingOccurrences(of: "сезона", with: "сезона ")
                    animeSeries = animeSeries.replacingOccurrences(of: "сезонов", with: "сезонов ")
                    animeSeries = animeSeries.replacingOccurrences(of: "серий", with: "серий ")
        
                    animeList.append(Anime(name: animeName, episodesCount: animeSeries, poster: URL(string: imgLink)!, link: link))
                }
            }
            // Передаем animeList в замыкание, когда данные загружены
            completion(animeList)
        }
    }
}
