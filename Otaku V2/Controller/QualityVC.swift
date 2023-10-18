//
//  QualityVC.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//

import Foundation
import UIKit
class QualityVC: UIViewController {
    
    private var verticalList: VerticalList<QualityCell, Unique>!
    
    let data = [
        Unique(name: "360p", link: URL(string: "300p-Link")!),
        Unique(name: "480p", link: URL(string: "480p-Link")!),
        Unique(name: "720p", link: URL(string: "720p-Link")!),
        Unique(name: "1080p", link: URL(string: "1080p-Link")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        title = "Quality"
        setupUI()
    }
    
    func setupUI() {
        self.verticalList = VerticalList<QualityCell, Unique>(frame: .zero)
        verticalList.data = data
        verticalList.backgroundColor = .white
        verticalList.didSelect = { data in
            print("\(data.name) -- \(data.link)")
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
