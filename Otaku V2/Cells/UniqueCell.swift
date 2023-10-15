//
//  InfoCell.swift
//  Otaku V2
//
//  Created by The WORLD on 14.10.2023.
//

import UIKit

class UniqueCell: UITableViewCell, VerticalListDelegate {
    var name: UILabel = StaticUIElements.createLabel()
    var link: URL!
    
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
    
    func configure(data: Unique, indexPath: IndexPath) {
        name.text = data.name
        link = data.link
    }

}
