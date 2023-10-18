//
//  SearchVC.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//

import Foundation
import UIKit

class SearchVC: UIViewController {
    
    private var verticalList: VerticalList<AnimeCell, Anime>!
    var searchBar = UISearchBar()

    var data = [Anime]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        title = "Search"
        setupUI()
    }
    
    func setupUI() {
        let resetBarButtonItem = UIBarButtonItem(image: UIImage(named: "reset"), style: .plain, target: self, action: #selector(onResetButtonClicked))

        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search..."
        searchBar.showsScopeBar = true
        searchBar.showsCancelButton = true
        searchBar.backgroundColor = UIColor(named: "background")
        
        
        self.navigationItem.rightBarButtonItem = resetBarButtonItem
        self.verticalList = VerticalList<AnimeCell, Anime>(frame: .zero)
        verticalList.backgroundColor = .white
        verticalList.height = 100
        verticalList.didSelect = { data in
            let infoVC = InfoVC()
            infoVC.anime = data
            self.navigationController?.pushViewController(infoVC, animated: true)
        }
        verticalList.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalList)
        view.addSubview(searchBar)
        searchBar.delegate = self
    
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            
            verticalList.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
            verticalList.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            verticalList.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            verticalList.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
    }
    
    @objc func onResetButtonClicked(_ sender: Any){
        verticalList.data = []
        searchBar.text = nil
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        search(page: 1, searchText: searchBar.text!) { [weak self] searchedAnime in
            self?.verticalList.data += searchedAnime
            DispatchQueue.main.async {
                self!.verticalList.reloadTableView()
            }
        }
    }
    

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        verticalList.data = []
        searchBar.text = nil
    }
}
