//
//  MovieList.swift
//  PopCorn
//
//  Created by Enzo on 31/05/2021.
//

import Foundation
import UIKit


struct MovieList: Decodable {
    let title: String
    let date: String
    let overview: String
    let poster: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case date = "release_date"
        case overview
        case poster = "poster_path"
        case id
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
        
}

struct MoviesList: Decodable{
    let results: [MovieList]

    func toMovie() -> [MovieList] {
            return results.compactMap { movie -> MovieList? in
                MovieList(title: movie.title, date: movie.date, overview: movie.overview, poster: movie.poster, id: movie.id)
            }
        }
}
