//
//  InfoView.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//

import Foundation
import UIKit

class InfoView: UIView {

    var poster: UIImageView!
    var genreLbl: UILabel = StaticUIElements.createLabel()
    var releaseYearLbl: UILabel = StaticUIElements.createLabel()
    var originalTitleLbl: UILabel = StaticUIElements.createLabel()
    var ageLimitLbl: UILabel = StaticUIElements.createLabel()
    var watchBtn: UIButton = StaticUIElements.createButton(title: "Смотреть", color: .green)
    var favouriteBtn: UIButton = StaticUIElements.createButton(title: "В избранное", color: .yellow)
    var isFavourite: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        if isFavourite {
            animeAdded()
        } else {
            animeNotAdded()
        }
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = .white
        poster = UIImageView(image: UIImage(named: "ragna"))
        poster.layer.cornerRadius = 15
        poster.clipsToBounds = true
        
        genreLbl.text = "Жанры: боевик и фэнтези."
        releaseYearLbl.text = "Год выпуска: 2023."
        originalTitleLbl.text = "Оригинальное название: Ragna Crimson"
        ageLimitLbl.text = "Возрастной рейтинг: 16+"

        let infoStack = UIStackView(arrangedSubviews: [genreLbl, releaseYearLbl, originalTitleLbl, ageLimitLbl])
        infoStack.spacing = 20
        infoStack.distribution = .fill
        infoStack.alignment = .leading
        infoStack.axis = .vertical
        
        let btnStack = UIStackView(arrangedSubviews: [watchBtn, favouriteBtn])
        btnStack.axis = .horizontal
        btnStack.spacing = 10
        btnStack.distribution = .fillEqually
        btnStack.alignment = .center
        
        self.addSubview(poster)
        self.addSubview(infoStack)
        self.addSubview(btnStack)
        
        poster.translatesAutoresizingMaskIntoConstraints = false
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        btnStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            poster.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            poster.widthAnchor.constraint(equalToConstant: 200),
            poster.heightAnchor.constraint(equalToConstant: 200),
            poster.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        
            infoStack.topAnchor.constraint(equalTo: poster.bottomAnchor, constant: 20),
            infoStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            infoStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            btnStack.topAnchor.constraint(equalTo: infoStack.bottomAnchor, constant: 20),
            btnStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            btnStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    func animeAdded() {
        favouriteBtn.setTitle("В избранном", for: .normal)
        favouriteBtn.backgroundColor = UIColor.yellow
    }
        
    func animeNotAdded() {
        favouriteBtn.setTitle("В избранное", for: .normal)
        favouriteBtn.backgroundColor = UIColor.white
        favouriteBtn.layer.borderWidth = 3.0
        favouriteBtn.layer.borderColor = UIColor.yellow.cgColor
    }
}
