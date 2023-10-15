//
//  Episodes.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//
import Foundation
import UIKit
class EpisodesVC: UIViewController {
    
    private var verticalList: VerticalList<UniqueCell, Unique>!

    let data = [
        Unique(name: "1 episode", link: URL(string: "order-by-rating")!),
        Unique(name: "2 episode", link: URL(string: "order-by-add-date")!),
        Unique(name: "3 episode", link: URL(string: "order-by-series-count")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episodes"
        setupUI()
    }
    
    func setupUI() {
        self.verticalList = VerticalList<UniqueCell, Unique>(frame: .zero)
        verticalList.data = data
        verticalList.backgroundColor = .white
        verticalList.didSelect = { data in
            print("\(data.name) -- \(data.link)")
            let qualityVC = QualityVC()
            self.navigationController?.pushViewController(qualityVC, animated: true)
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
