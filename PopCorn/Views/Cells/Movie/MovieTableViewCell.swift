//
//  MovieTableViewCell.swift
//  PopCorn
//
//  Created by Enzo on 26/04/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsysLabel: UILabel!
    
    @IBOutlet weak var posterImageView: UIImageView!
    static let reuseID: String="MovieTableViewCellReuseID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.text = nil
        dateLabel.text = nil
        synopsysLabel.text = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func fill(movie: Movie){
                
        titleLabel.text = movie.title
        dateLabel.text = movie.date
        synopsysLabel.text = movie.synopsis
        posterImageView.image = movie.getFilmImage()
        
    }
}
