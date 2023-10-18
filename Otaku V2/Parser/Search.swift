//
//  Parser+Search.swift
//  Otaku V2
//
//  Created by The WORLD on 18.10.2023.
//

import Foundation
import Alamofire
import Kanna


func search(page: Int, searchText: String, completion: @escaping ([Anime]) -> Void) {
    var animeList: [Anime] = []
    var link: URL!
    var imageLink: URL!
//    let url = URL(string: "")
    
    let headers: HTTPHeaders = [
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/117.0",
        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
    ]

//    let parameters = "ajax_load=yes&start_from_page=\(page)&show_search=\(searchText)"
    let parameters: [String: Any] = [
                "ajax_load": "yes",
                "start_from_page": page,
                "show_search": searchText
            ]

    AF.request("https://jut.su/anime/", method: .post, parameters: parameters, headers: headers).responseData { response in
        switch response.result {
        case .success(let data):
            if let doc = try? HTML(html: data, encoding: .windowsCP1251) {
                for animeListElement in doc.css(".all_anime_global") {
                    if let animeName = animeListElement.at_css(".aaname")?.text,
                        var animeLink = animeListElement.at_css("a")?["href"],
                        var animeSeries = animeListElement.at_css(".aailines")?.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                        let imgLink = animeListElement.at_css(".all_anime_image")?["style"]?.components(separatedBy: "'")[1] {
                        imageLink = URL(string: imgLink)
                        
                        // MARK: - EDIT Variables
                        animeLink = animeLink.replacingOccurrences(of: "/", with: "")
                        animeLink = "https://jut.su/\(animeLink)"
                        link = URL(string: animeLink)
                        
                        animeSeries = animeSeries.replacingOccurrences(of: "сезона", with: "сезона ")
                        animeSeries = animeSeries.replacingOccurrences(of: "сезонов", with: "сезонов ")
                        animeSeries = animeSeries.replacingOccurrences(of: "серий", with: "серий ")
                        
                        animeList.append(Anime(name: animeName, episodesCount: animeSeries, poster: imageLink, link: link ))
                    }
                }
                completion(animeList)
            }
        case .failure(let error):
            print("Alamofire request failed with error: \(error)")
            completion([])
        }
    }
}


