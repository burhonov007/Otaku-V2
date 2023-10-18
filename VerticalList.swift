//
//  VerticalList.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//

import Foundation
import UIKit

protocol VerticalListDelegate {
    associatedtype Model
    func configure(data: Model, indexPath: IndexPath)
}

class VerticalList<T: UITableViewCell, M>: UIView, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout where T : VerticalListDelegate, T.Model == M {
    
    private let cellIdentifier = "cell"
    var tableView: UITableView!
    var height: CGFloat!
    
    var data: [M] = [] {
        didSet { tableView.reloadData() }
    }
    
    var didSelect: ((M) -> Void)?
    var didSelectWithCell: ((M, IndexPath) -> Void)?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
        
        tableView.register(T.self, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }

    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! T
        cell.configure(data: data[indexPath.row], indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelect?(data[indexPath.row])
        didSelectWithCell?(data[indexPath.row], indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = height {
            return height
        }
        return tableView.rowHeight
    }
}
