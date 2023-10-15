//
//  FilterVC.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//

import Foundation
import UIKit

class FilterVC: UIViewController {
    
    private var verticalList: VerticalList<FilterCell, Filter>!

    let data = [
        Filter(name: "По рейтингу", link: URL(string: "order-by-rating")!),
        Filter(name: "По году добавления", link: URL(string: "order-by-add-date")!),
        Filter(name: "По количеству серий", link: URL(string: "order-by-series-count")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Filter"
        setupUI()
    }
    
    func setupUI() {
        let resetBarButtonItem = UIBarButtonItem(image: UIImage(named: "reset"), style: .plain, target: self, action: #selector(onResetButtonClicked))
        let doneBarButtonItem = UIBarButtonItem(image: UIImage(named: "done"), style: .plain, target: self, action: #selector(onDoneButtonClicked))

        self.navigationItem.rightBarButtonItems = [doneBarButtonItem, resetBarButtonItem]
        self.verticalList = VerticalList<FilterCell, Filter>(frame: .zero)
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
    
    @objc func onResetButtonClicked(_ sender: Any){
        print("ResetButtonClicked")
    }
    
    @objc func onDoneButtonClicked(_ sender: Any){
        print("DoneButtonClicked")
    }
}

