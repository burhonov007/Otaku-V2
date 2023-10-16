//
//  FavouriteVC.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//

import UIKit

class FavouriteVC: UIViewController {
    
    private var verticalList: VerticalList<AnimeCell, Anime>!

    let data = [
        Anime(name: "Jujutsu Kaisen", episodesCount: "44 episodes", poster: UIImage(named: "jujutsu")!, link: URL(string: "jujutsu.html")!),
        Anime(name: "Fullmetall Alchemist", episodesCount: "106 episodes", poster: UIImage(named: "metal")!, link: URL(string: "metal.html")!),
        Anime(name: "Ragna Red", episodesCount: "2 episodes", poster: UIImage(named: "ragna")!, link: URL(string: "ragna.html")!),
        Anime(name: "Nanatsu No Tazai", episodesCount: "200 episodes", poster: UIImage(named: "nanatsu")!, link: URL(string: "nanatsu.html")!),
        Anime(name: "Jujutsu Kaisen", episodesCount: "44 episodes", poster: UIImage(named: "jujutsu")!, link: URL(string: "jujutsu.html")!),
        Anime(name: "Fullmetall Alchemist", episodesCount: "106 episodes", poster: UIImage(named: "metal")!, link: URL(string: "metal.html")!),
        Anime(name: "Ragna Red", episodesCount: "2 episodes", poster: UIImage(named: "ragna")!, link: URL(string: "ragna.html")!),
        Anime(name: "Nanatsu No Tazai", episodesCount: "200 episodes", poster: UIImage(named: "nanatsu")!, link: URL(string: "nanatsu.html")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favourites"
        setupUI()
    }
    
    func setupUI() {
        self.verticalList = VerticalList<AnimeCell, Anime>(frame: .zero)
        verticalList.data = data
        verticalList.height = 100
        verticalList.backgroundColor = .white
        verticalList.didSelect = { data in
            print(data.name)
            let infoVC = InfoVC()
            infoVC.animeName = data.name
            infoVC.image = data.poster
            self.navigationController?.pushViewController(infoVC, animated: true)
        }
        verticalList.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalList)
        NSLayoutConstraint.activate([
            verticalList.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            verticalList.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            verticalList.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            verticalList.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
    }
}

