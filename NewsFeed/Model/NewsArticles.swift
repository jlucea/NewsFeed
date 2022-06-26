//
//  NewsArticles.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 23/6/22.
//

import Foundation
import CoreData

class NewsArticles : Codable {

    let status : String
    let totalResults : Int
    let articles : [NewsArticle]
    
    func getSize() -> Int {
        return totalResults
    }
    
}

