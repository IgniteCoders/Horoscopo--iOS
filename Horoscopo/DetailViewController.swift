//
//  DetailViewController.swift
//  Horoscopo
//
//  Created by Tardes on 13/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var horoscope: Horoscope!

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var datesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = horoscope.name
        
        datesLabel.text = horoscope.dates
        iconImageView.image = horoscope.icon
    }

}
