//
//  SearchVC.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//

import Foundation
import UIKit

class SearchVC: UIViewController {
    
    private var verticalList: VerticalList<FilterCell, Filter>!
    var searchBar = UISearchBar()

    var data = [
        Filter(name: "По рейтингу", link: URL(string: "order-by-rating")!),
        Filter(name: "По году добавления", link: URL(string: "order-by-add-date")!),
        Filter(name: "По количеству серий", link: URL(string: "order-by-series-count")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        setupUI()
    }
    
    func setupUI() {
        let resetBarButtonItem = UIBarButtonItem(image: UIImage(named: "reset"), style: .plain, target: self, action: #selector(onResetButtonClicked))

        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search..."
        searchBar.showsScopeBar = true
        searchBar.showsCancelButton = true
        searchBar.backgroundColor = .white
        
        
        self.navigationItem.rightBarButtonItem = resetBarButtonItem
        self.verticalList = VerticalList<FilterCell, Filter>(frame: .zero)
        verticalList.backgroundColor = .white
        verticalList.didSelect = { data in
            print("\(data.name) -- \(data.link)")
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
        verticalList.data = data
    }
    

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        verticalList.data = []
        searchBar.text = nil
    }
}
