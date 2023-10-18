//
//  FavouriteVC.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//

import UIKit

class FavouriteVC: UIViewController {
    
    private var verticalList: VerticalList<AnimeCell, Anime>!

    var data = [Anime]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        title = "Favourites"
        data = FavouriteManager.loadData()
        if data.isEmpty {
            Alerts.AccessDeniedAlertOrNoData(title: "Нет аниме", message: "Вы еще не добавляли аниме в избранное", viewController: self)
        }
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        data = FavouriteManager.loadData()
        verticalList.reloadTableView()
    }
    
    func setupUI() {
        self.verticalList = VerticalList<AnimeCell, Anime>(frame: .zero)
        verticalList.data = data
        verticalList.height = 100
        verticalList.backgroundColor = .white
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
}

