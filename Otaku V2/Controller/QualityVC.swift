//
//  QualityVC.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//

import Foundation
import UIKit
class QualityVC: UIViewController {
    
    private var verticalList: VerticalList<QualityCell, Quality>!
    
    let data: [Quality] = [
        Quality(title: "360p", link: URL(string: "360p LINK")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Quality"
        setupUI()
    }
    
    func setupUI() {
        self.verticalList = VerticalList<QualityCell, Quality>(frame: .zero)
        verticalList.data = data
        verticalList.backgroundColor = .white
        verticalList.didSelect = { data in
            print("\(data.title) -- \(data.link)")
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
