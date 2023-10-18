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
        view.backgroundColor = UIColor(named: "background")
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
        
        verticalList.didSelectWithCell = { data, indexPath in
            let cell = self.verticalList.tableView.cellForRow(at: indexPath) as! FilterCell
            if data.isSelect {
                cell.selectBtn.setTitleColor(UIColor(named: "foreground"), for: .normal)
            } else {
                cell.selectBtn.setTitleColor(UIColor(named: "foreground")?.withAlphaComponent(0), for: .normal)
            }
            cell.selectBtn.isHidden = !data.isSelect
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
        let mainVC = MainVC()
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
    
    @objc func onDoneButtonClicked(_ sender: Any){
        let mainVC = MainVC()
        self.navigationController?.pushViewController(mainVC, animated: true)
    }
}

