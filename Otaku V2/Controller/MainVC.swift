//
//  ViewController.swift
//  Otaku V2
//
//  Created by The WORLD on 04.10.2023.
//

import UIKit

class MainVC: UIViewController {
    
    private var verticalList: VerticalList<AnimeCell, Anime>!

    var data = [Anime]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Otaku"
        loadPage()
        setupUI()
        view.backgroundColor = UIColor(named: "background")
    }
    
    func setupUI() {
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(onSearchButtonClicked))
        let favouriteBarButtonItem = UIBarButtonItem(image: UIImage(named: "favourite"), style: .plain, target: self, action: #selector(onFavouriteButtonClicked))
        let sortBarButtonItem = UIBarButtonItem(image: UIImage(named: "sort"), style: .plain, target: self, action: #selector(onSortButtonClicked))
        let filterhBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: #selector(onFilterButtonClicked))
        
        
        self.navigationItem.rightBarButtonItems = [searchBarButtonItem, favouriteBarButtonItem]
        self.navigationItem.leftBarButtonItems = [sortBarButtonItem, filterhBarButtonItem]
        self.verticalList = VerticalList<AnimeCell, Anime>(frame: .zero)
        verticalList.data = data
        verticalList.height = 100
        verticalList.didSelect = { data in
            let infoVC = InfoVC()
            infoVC.anime = data
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
    
    @objc func onSearchButtonClicked(_ sender: Any){
        let searchVC = SearchVC()
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc func onFavouriteButtonClicked(_ sender: Any){
        let favoriteVC = FavouriteVC()
        navigationController?.pushViewController(favoriteVC, animated: true)
    }
    
    @objc func onSortButtonClicked(_ sender: Any){
        let sortVC = SortVC()
        navigationController?.pushViewController(sortVC, animated: true)
    }
    
    @objc func onFilterButtonClicked(_ sender: Any){
        let filterVC = FilterVC()
        navigationController?.pushViewController(filterVC, animated: true)
    }
    
    
    func loadPage() {
        getAnime(from: "https://jut.su/anime/") { [self] animeList in
            verticalList.data += animeList!
        }
    }
    
    
}
