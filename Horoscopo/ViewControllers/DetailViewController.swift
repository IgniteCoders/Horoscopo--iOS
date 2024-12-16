//
//  DetailViewController.swift
//  Horoscopo
//
//  Created by Tardes on 13/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var horoscope: Horoscope!
    var isFavorite: Bool = false
    var session: SessionManager!

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var datesLabel: UILabel!
    
    @IBOutlet weak var favoriteMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        session = SessionManager()

        // Do any additional setup after loading the view.
        navigationItem.title = horoscope.name
        
        datesLabel.text = horoscope.dates
        iconImageView.image = horoscope.icon
        
        isFavorite = session.isFavorite(horoscopeId: horoscope.id)
        setFavoriteIcon()
    }
    
    func setFavoriteIcon() {
        if (isFavorite) {
            favoriteMenu.image = UIImage(systemName: "heart.fill")
        } else {
            favoriteMenu.image = UIImage(systemName: "heart")
        }
    }

    @IBAction func setFavorite(_ sender: Any) {
        if (isFavorite) {
            session.setFavorite(horoscopeId: "")
        } else {
            session.setFavorite(horoscopeId: horoscope.id)
        }
        isFavorite = !isFavorite
        setFavoriteIcon()
    }
}
