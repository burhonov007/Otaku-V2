//
//  InfoVC.swift
//  Otaku V2
//
//  Created by The WORLD on 04.10.2023.
//

import UIKit

class InfoVC: UIViewController {
    var anime: Anime!
    var infoView: InfoView!
    var loadedAnimeList = FavouriteManager.loadData()
    var isAnimeAddedToFavourites = false
    
    override func loadView() {
        infoView = InfoView()
        self.view = infoView
        view.backgroundColor = UIColor(named: "AccentColor")
        loadedAnimeList.forEach { Anime in
            print("name - \(Anime.name)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .automatic
        title = anime.name
        infoView.poster.sd_setImage(with: anime.poster, placeholderImage: UIImage(named: "no image"))
        infoView.watchBtn.addTarget(self, action: #selector(onWatchButtonClicked), for: .touchUpInside)
        infoView.favouriteBtn.addTarget(self, action: #selector(onFavouriteButtonClicked), for: .touchUpInside)
        
        
        isAnimeAddedToFavourites = loadedAnimeList.contains { anime in
            return anime.name == self.title
        }
        
        if isAnimeAddedToFavourites {
            animeAdded()
        } else {
            animeNotAdded()
        }
        
    }
    
    @objc func onWatchButtonClicked(_ sender: Any) {
        let episodeVC = EpisodesVC()
        navigationController?.pushViewController(episodeVC, animated: true)
    }
    
    @objc func onFavouriteButtonClicked(_ sender: Any) {
        if !isAnimeAddedToFavourites {
           loadedAnimeList.append(anime)
           FavouriteManager.saveData(animeList: loadedAnimeList)
           animeAdded()
           isAnimeAddedToFavourites = true
       } else {
           loadedAnimeList.removeAll { anime in
               return anime.name == self.title
           }
           FavouriteManager.saveData(animeList: loadedAnimeList)
           animeNotAdded()
           isAnimeAddedToFavourites = false
       }
    }
    
    func animeAdded() {
        infoView.favouriteBtn.setTitle("В избранном", for: .normal)
        infoView.favouriteBtn.backgroundColor = UIColor.yellow
    }
        
    func animeNotAdded() {
        infoView.favouriteBtn.setTitle("В избранное", for: .normal)
        infoView.favouriteBtn.backgroundColor = UIColor.white
        infoView.favouriteBtn.layer.borderWidth = 3.0
        infoView.favouriteBtn.backgroundColor = UIColor(named: "AccentColor")
        infoView.favouriteBtn.layer.borderColor = UIColor.yellow.cgColor
    }
}
