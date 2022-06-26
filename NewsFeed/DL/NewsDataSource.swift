//
//  NewsDataSource.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 23/6/22.
//

import Foundation

protocol NewsDataSource {
    
    init(handler: NewsHandler)
    
    func getNews()
    
}
