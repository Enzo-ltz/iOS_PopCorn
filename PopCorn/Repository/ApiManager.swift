//
//  ApiManager.swift
//  PopCorn
//
//  Created by Enzo on 18/05/2021.
//

import Foundation

enum ApiPath: String {
    case categories = "/genre/movie/list"
    case movie = "/movie/"
    case movies = "/discover/movie"
}

struct ApiManager {
    static var shared = ApiManager()
    
    let BASE_URL = "https://api.themoviedb.org/3"
    let API_KEY =  "5a88f6a3a255d01d819301d8c98dc442"
    let IMG_BASE_URL = "https://image.tmdb.org/t/p/"
    
    func createUrl(path: ApiPath) -> URLComponents? {
        let url = URLComponents(string: "\(self.BASE_URL)\(path.rawValue)?api_key=\(self.API_KEY)&language=fr-FR")
        return url
    }
}
