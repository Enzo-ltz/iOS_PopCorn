//
//  ViewController.swift
//  PopCorn
//
//  Created by Enzo on 12/04/2021.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    var movieId: Int = 0
    
    //let movie = Movie(title: "Kaamelott", subtitle: "Kaamelott Premier Volet", date: "23-12-2000", duration: 120, synopsis:"LOREM UPIAZUHUI", categories: [Genre(id: 12, name: "Humour")], affiche: "", poster: "")
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var categorieLabel1: UILabel!
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie :Movie?
    let movieRepository = MovieRepository()
    var spinner = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieRepository.getMovieDetail(movieId: movieId) { response in
            if let movie = response {
                self.movie = movie
                DispatchQueue.main.async {
                    self.setupInformations()
                    self.spinner.stopAnimating()
                }
            }
        }
    }
    
    func setupInformations() {
        
        let durationString :String = "\(movie!.duration) min"
        titleLabel.text = movie!.title
        subtitleLabel.text = movie!.subtitle
        dateLabel.text = movie!.date
        durationLabel.text = durationString
        synopsisLabel.text = movie!.overview
        categorieLabel1.text = movie!.categories[0].name
        filmImageView.image = movie!.getFilmImage()
        posterImageView.image = movie!.getPoster()
        
        
    }

    @IBAction func PlayButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=hCKPvMT1E1I")!)
    }
    
}
