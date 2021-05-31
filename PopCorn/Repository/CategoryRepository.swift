//
//  CategoryRepository.swift
//  PopCorn
//
//  Created by Enzo on 18/05/2021.
//

import Foundation

struct CategoryRepository {
    
    func getCategories(completion: @escaping ((CategoriesList?) -> Void)) -> Void {
        let url = ApiManager.shared.createUrl(path: ApiPath.categories, categorie: nil)
        if let cateUrl = url?.url {
            RequestManager.shared.requestData(url: cateUrl) { data in
                completion(try? JSONDecoder().decode(CategoriesList.self, from: data))
            }
        }
    }
}
