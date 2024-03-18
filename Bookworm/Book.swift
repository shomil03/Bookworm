//
//  Book.swift
//  Bookworm
//
//  Created by Shomil Singh on 18/03/24.
//

import Foundation
import SwiftData

@Model
class Book{
    let name : String
    let author : String
    let genres : String
    let review : String
    let rating : Int
    
    init(name: String, author: String, genres: String, review: String, rating: Int) {
        self.name = name
        self.author = author
        self.genres = genres
        self.review = review
        self.rating = rating
    }
}
