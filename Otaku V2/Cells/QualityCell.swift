//
//  QualityCell.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//

import Foundation
import UIKit

class QualityCell: UITableViewCell, VerticalListDelegate {
    var title: UILabel = StaticUIElements.createLabel(weight: .bold, size: 18)
    var link = URL(string: "jut.su/anime")
    var watchBtn: UIButton = StaticUIElements.createButton(title: "👁", color: .systemYellow)
    var downloadBtn: UIButton = StaticUIElements.createButton(title: "🛩", color: .systemGreen)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        title.numberOfLines = 1
        title.translatesAutoresizingMaskIntoConstraints = false
        watchBtn.translatesAutoresizingMaskIntoConstraints = false
        downloadBtn.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(title)
        contentView.addSubview(downloadBtn)
        contentView.addSubview(watchBtn)
        
        downloadBtn.addTarget(self, action: #selector(onDownloadButtonClicked), for: .touchUpInside)
        watchBtn.addTarget(self, action: #selector(onWatchButtonClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: watchBtn.leadingAnchor, constant: -10),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            watchBtn.trailingAnchor.constraint(equalTo: downloadBtn.leadingAnchor, constant: -10),
            watchBtn.widthAnchor.constraint(equalToConstant: 100),
            watchBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            downloadBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            downloadBtn.widthAnchor.constraint(equalToConstant: 100),
            downloadBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: Quality, indexPath: IndexPath) {
        title.text = data.title
        link = data.link
    }
    
    @objc func onDownloadButtonClicked(_ sender: UIButton) {
        print("downloaded with url \(String(describing: link))")
    }
    
    @objc func onWatchButtonClicked(_ sender: UIButton) {
        print("watched with url \(String(describing: link))")
    }
}
