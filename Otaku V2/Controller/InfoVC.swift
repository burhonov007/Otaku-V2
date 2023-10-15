//
//  InfoVC.swift
//  Otaku V2
//
//  Created by The WORLD on 04.10.2023.
//

import UIKit

class InfoVC: UIViewController {
    var infoView: InfoView!
    var animeName: String!
    var image: UIImage!
    var isFavourite: Bool = false
    
    override func loadView() {
        infoView = InfoView()
        self.view = infoView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .automatic
        title = animeName
        infoView.poster.image = image
        infoView.watchBtn.addTarget(self, action: #selector(onWatchButtonClicked), for: .touchUpInside)
        infoView.favouriteBtn.addTarget(self, action: #selector(onFavouriteButtonClicked), for: .touchUpInside)
        
        
    }
    
    @objc func onWatchButtonClicked(_ sender: Any) {
        let episodeVC = EpisodesVC()
        navigationController?.pushViewController(episodeVC, animated: true)
    }
    
    @objc func onFavouriteButtonClicked(_ sender: Any) {
        print("12")
        infoView.isFavourite = !infoView.isFavourite
    }
    
    
}
