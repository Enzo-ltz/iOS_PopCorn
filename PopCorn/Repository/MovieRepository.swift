//
//  MovieRepository.swift
//  PopCorn
//
//  Created by Enzo on 31/05/2021.
//

import Foundation

struct MovieRepository {
    
    func getMovies(categorieId: Int, completion: @escaping ((MoviesList?) -> Void)) -> Void {
        
        let url = ApiManager.shared.createUrl(path: ApiPath.movies, categorie: categorieId)
        
        
        if let cateUrl = url?.url {
            RequestManager.shared.requestData(url: cateUrl) { data in
                completion(try? JSONDecoder().decode(MoviesList.self, from: data))
            }
        }
        
    }
}
