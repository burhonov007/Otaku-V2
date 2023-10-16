//
//  Filter.swift
//  Otaku V2
//
//  Created by The WORLD on 15.10.2023.
//
import Foundation
class Filter {
    var name: String
    var link: URL
    var isSelect: Bool
    
    init(name: String, link: URL, isSelect: Bool = false) {
        self.name = name
        self.link = link
        self.isSelect = isSelect
    }
}
