//
//  Static.swift
//  Otaku V2
//
//  Created by The WORLD on 14.10.2023.
//

import Foundation
import UIKit

class StaticUIElements {
    
    static func createLabel(weight: UIFont.Weight? = .medium, size: CGFloat? = 16) -> UILabel {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: size!, weight: weight!)
        return label
    }
    
    static func createButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }
}
