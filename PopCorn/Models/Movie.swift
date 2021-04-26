//
//  Movie.swift
//  PopCorn
//
//  Created by Enzo on 26/04/2021.
//

import Foundation

struct Movie {
    let title: String
    let subtitle: String
    let date: String
    let duration: Int
    let synopsis: String
    let categories : [Genre]
    
        /*init?(){
        title = "Kaamelott"
        subtitle = "Kaamelott Premier Volet"
        date = "21-07-2021"
        duration = 120
        synopsis = "Loremp Ipsum très beau"
        categories = [Genre(id:12, name:"Humour")]
    }*/
}

struct Genre {
    let id: Int
    let name: String
}
