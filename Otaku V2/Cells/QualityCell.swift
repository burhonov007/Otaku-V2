//
//  QualityCell.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//

import Foundation
import UIKit

class QualityCell: UITableViewCell, VerticalListDelegate {
    var name: UILabel = StaticUIElements.createLabel(weight: .bold, size: 18)
    var link = URL(string: "jut.su/anime")
    var watchBtn: UIButton = StaticUIElements.createButton(title: "", color: .clear)
    var downloadBtn: UIButton = StaticUIElements.createButton(title: "", color: .clear)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        name.numberOfLines = 1
        name.translatesAutoresizingMaskIntoConstraints = false
        watchBtn.translatesAutoresizingMaskIntoConstraints = false
        downloadBtn.translatesAutoresizingMaskIntoConstraints = false
        
        watchBtn.setImage(UIImage(named: "play"), for: .normal)
        downloadBtn.setImage(UIImage(named: "download"), for: .normal)
        
        contentView.addSubview(name)
        contentView.addSubview(downloadBtn)
        contentView.addSubview(watchBtn)
        
        downloadBtn.addTarget(self, action: #selector(onDownloadButtonClicked), for: .touchUpInside)
        watchBtn.addTarget(self, action: #selector(onWatchButtonClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: watchBtn.leadingAnchor, constant: -10),
            name.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            watchBtn.trailingAnchor.constraint(equalTo: downloadBtn.leadingAnchor, constant: -10),
            watchBtn.widthAnchor.constraint(equalToConstant: 50),
            watchBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            downloadBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            downloadBtn.widthAnchor.constraint(equalToConstant: 50),
            downloadBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: Unique, indexPath: IndexPath) {
        name.text = data.name
        link = data.link
    }
    
    @objc func onDownloadButtonClicked(_ sender: UIButton) {
        print("downloaded with url \(String(describing: link))")
    }
    
    @objc func onWatchButtonClicked(_ sender: UIButton) {
        print("watched with url \(String(describing: link))")
    }
}
