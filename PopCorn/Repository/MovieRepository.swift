//
//  MovieRepository.swift
//  PopCorn
//
//  Created by Enzo on 31/05/2021.
//

import Foundation

struct MovieRepository {
    
    func getMovies(categorieId: Int, completion: @escaping ((MoviesList?) -> Void)) -> Void {
        
//        guard let categorie = categorieId else {
//            return
//        }
        
        let url = ApiManager.shared.createUrl(path: ApiPath.movies, categorie: categorieId)
        
        
        if let cateUrl = url?.url {
            print(cateUrl)
            RequestManager.shared.requestData(url: cateUrl) { data in
                print("Data : \(data)")
                completion(try? JSONDecoder().decode(MoviesList.self, from: data))
                
            }
        }
    }
}
