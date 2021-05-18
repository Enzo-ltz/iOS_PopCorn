//
//  Category.swift
//  PopCorn
//
//  Created by Enzo on 18/05/2021.
//

import Foundation
import UIKit

struct Category: Decodable {
    let id: Int
    let name: String
    
   
        /*init?(){
        title = "Kaamelott"
        subtitle = "Kaamelott Premier Volet"
        date = "21-07-2021"
        duration = 120
        synopsis = "Loremp Ipsum très beau"
        categories = [Genre(id:12, name:"Humour")]
    }*/
}

struct CategoriesList: Decodable{
    let genres: [Category]
    
    func toCategory() -> [Category] {
            return genres.compactMap { category -> Category? in
                Category(id: category.id, name: category.name)
            }
        }
}
