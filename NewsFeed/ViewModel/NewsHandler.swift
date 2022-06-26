//
//  NewsHandler.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 23/6/22.
//

import Foundation

final class NewsHandler : ObservableObject {
    
    @Published var newsArticles : [NewsArticle] = []
    /*
    @Published var newsArticles : [NewsArticle] = [NewsArticle(sourceId: "X", sourceName: "XX", author: "Jaime Lucea", title: "Sample Article 1",
                                        description: "This is an article", url: "urlString goes here", urlImg: "urlString goes here", date: "dateString here", content: "This is the content of an article ")]
    */
    
    func getNews(){
                
        // Call data source for data
        let datasource = NewsApiOrgDS(handler: self)
        datasource.getNews()
    }

    func handleNews(news: NewsArticles){
        print("NewsHandler - Handling received data")
        print("Found \(news.totalResults) articles")
        
        // Data values are published from the main thread
        DispatchQueue.main.async { () -> Void in
            self.newsArticles = news.articles
        }

    }
    
    func handleError(){
        
    }
    
}
