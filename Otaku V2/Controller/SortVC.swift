//
//  SortVC.swift
//  Otaku V2
//
//  Created by The WORLD on 14.10.2023.
//

import UIKit

class SortVC: UIViewController {
    
    private var verticalList: VerticalList<UniqueCell, Unique>!

    let data = [
        Unique(name: "По рейтингу", link: URL(string: "order-by-rating")!),
        Unique(name: "По году добавления", link: URL(string: "order-by-add-date")!),
        Unique(name: "По количеству серий", link: URL(string: "order-by-series-count")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sort"
        view.backgroundColor = UIColor(named: "background")
        setupUI()
    }
    
    func setupUI() {
        self.verticalList = VerticalList<UniqueCell, Unique>(frame: .zero)
        verticalList.data = data
        verticalList.backgroundColor = .white
        verticalList.didSelect = { data in
            let mainVC = MainVC()
            self.navigationController?.pushViewController(mainVC, animated: true)
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

