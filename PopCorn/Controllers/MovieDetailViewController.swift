//
//  ViewController.swift
//  PopCorn
//
//  Created by Enzo on 12/04/2021.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    let movie = Movie(title: "Kaamelott", subtitle: "Kaamelott Premier Volet", date: "23-12-2000", duration: 120, synopsis:"LOREM UPIAZUHUI", categories: [Genre(id: 12, name: "Humour")])
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var categorieLabel1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private func setupViews() {
        let durationString :String = "\(movie.duration)"
        titleLabel.text = movie.title
        subtitleLabel.text = movie.subtitle
        dateLabel.text = movie.date
        durationLabel.text = durationString
        synopsisLabel.text = movie.synopsis
        categorieLabel1.text = movie.categories[0].name
        
    }

    @IBAction func PlayButton(_ sender: UIButton) {
        print("In Button")
        UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=hCKPvMT1E1I")!)
    }
    
}
