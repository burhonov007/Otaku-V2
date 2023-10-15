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
    var isSelect: Bool!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        name.numberOfLines = 1
        name.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(name)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            name.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: Filter, indexPath: IndexPath) {
        name.text = data.name
        link = data.link
    }

}
