//
//  Movie.swift
//  PopCorn
//
//  Created by Enzo on 26/04/2021.
//

import Foundation
import UIKit

struct Movie: Decodable {
    let title: String
    let subtitle: String
    let date: String
    let duration: Int
    let overview: String
    let categories : [Genre]
    let filmImage: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case subtitle = "tagline"
        case date = "release_date"
        case duration = "runtime"
        case overview
        case categories = "genres"
        case filmImage = "backdrop_path"
        case poster = "poster_path"
    }
    
    func getFilmImage() -> UIImage?{
        let posterUrlStr = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/\(self.filmImage)"
        
        guard let imageUrl:URL = URL(string: posterUrlStr) else {
            return UIImage(named:"affiche")
        }
        
        guard let posterImageData = try? Data(contentsOf: imageUrl) else {
            return UIImage(named:"affiche")
        }
        let posterUIImage = UIImage(data: posterImageData)
        
        return posterUIImage
    }
    
    func getPoster() -> UIImage?{
        let posterUrlStr = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/\(self.poster)"
        
        guard let imageUrl:URL = URL(string: posterUrlStr) else {
            return UIImage(named:"affiche")
        }
        
        guard let posterImageData = try? Data(contentsOf: imageUrl) else {
            return UIImage(named:"affiche")
        }
        let posterUIImage = UIImage(data: posterImageData)
        
        return posterUIImage
    }
        /*init?(){
        title = "Kaamelott"
        subtitle = "Kaamelott Premier Volet"
        date = "21-07-2021"
        duration = 120
        synopsis = "Loremp Ipsum très beau"
        categories = [Genre(id:12, name:"Humour")]
    }*/
}

struct Genre: Decodable {
    let id: Int
    let name: String
}

struct MovieDetail: Decodable {
    let result: Movie
    
    func toMovie() -> Movie {
        return result
    }
    
}

