//
//  NewsArticle.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 23/6/22.
//

import Foundation

struct NewsArticle : Codable, Identifiable {
    
    var id = UUID()
    
    let source : Source
    let author : String?
    let title: String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt: String?
    let content: String?
    
    private enum CodingKeys: String, CodingKey {
            case source, author, title, description, url, urlToImage, publishedAt, content
        }
    
    init(sourceId:String, sourceName:String, author: String, title: String, description: String, url: String, urlImg: String, date: String, content: String){
        self.source = Source(id: sourceId, name:sourceName)
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlImg
        self.publishedAt = date
        self.content = content
    }
}

struct Source : Codable {
    let id : String?
    let name : String?
    
    
    init(id: String, name: String){
        self.id = id
        self.name = name
    }
}
