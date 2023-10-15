//
//  AnimeCell.swift
//  Otaku V2
//
//  Created by The WORLD on 05.10.2023.
//

import UIKit

class AnimeCell: UITableViewCell, VerticalListDelegate {

    var poster: UIImageView = UIImageView(image: UIImage(named: "ragna"))
    var name: UILabel = StaticUIElements.createLabel(weight: .bold, size: 18)
    var episodes: UILabel = StaticUIElements.createLabel()
    var link: URL!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        name.numberOfLines = 0
        poster.layer.cornerRadius = poster.frame.height / 4
        poster.clipsToBounds = true
        
        let infoStack = UIStackView(arrangedSubviews: [name,episodes])
        infoStack.distribution = .fillProportionally
        infoStack.spacing = 10
        infoStack.axis = .vertical
        infoStack.alignment = .leading
        
        self.contentView.addSubview(poster)
        self.contentView.addSubview(infoStack)
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            poster.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            poster.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            poster.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            poster.widthAnchor.constraint(equalTo: poster.heightAnchor),
            
            infoStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            infoStack.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 10),
            infoStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            infoStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: Anime, indexPath: IndexPath) {
        poster.image = data.poster
        name.text = data.name
        episodes.text = data.episodesCount
        link = data.link
    }
}
