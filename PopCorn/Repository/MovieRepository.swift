//
//  MovieRepository.swift
//  PopCorn
//
//  Created by Enzo on 31/05/2021.
//

import Foundation

struct MovieRepository {
    
    func getMoviesList(categorieId: Int, completion: @escaping ((MoviesList?) -> Void)) -> Void {
        
        var params: [URLQueryItem] = []
        params.append(URLQueryItem(name: "with_genres", value: "\(categorieId)"))
        
        let url = ApiManager.shared.createUrl(pathUrl: ApiPath.movies, queryParams: params)
        
        
        if let cateUrl = url?.url {
            RequestManager.shared.requestData(url: cateUrl) { data in
                completion(try? JSONDecoder().decode(MoviesList.self, from: data))
            }
        }
        
    }
    
    func getMovieDetail(movieId: Int, completion: @escaping ((Movie?) -> Void)) -> Void {
        
        var url = ApiManager.shared.createUrl(pathUrl: ApiPath.movie, queryParams: [URLQueryItem(name: "append_to_response", value: "videos")])
        
        url?.path += String(movieId)
               
        
        if let cateUrl = url?.url {
            RequestManager.shared.requestData(url: cateUrl) { data in
                print(cateUrl)
                completion(try? JSONDecoder().decode(Movie.self, from: data))
            }
        }
        
    }
}
