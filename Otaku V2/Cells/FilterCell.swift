//
//  FilterCell.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//

import Foundation
import UIKit

class FilterCell: UITableViewCell, VerticalListDelegate {
    var name: UILabel = StaticUIElements.createLabel()
    var link: URL!
    var isSelect: Bool = false
    var selectBtn: UIButton = StaticUIElements.createButton(title: "✔︎", color: .clear)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        name.numberOfLines = 1
        name.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(name)
        selectBtn.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(selectBtn)
        selectBtn.setTitleColor(.clear, for: .normal)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: selectBtn.leadingAnchor, constant: -10),
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            selectBtn.widthAnchor.constraint(equalTo: contentView.heightAnchor),
            selectBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            selectBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: Filter, indexPath: IndexPath) {
        name.text = data.name
        link = data.link
        isSelect = data.isSelect
    }
    
}
