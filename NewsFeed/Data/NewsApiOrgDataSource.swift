//
//  NewsApiOrgDS.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 23/6/22.
//

import Foundation

class NewsAPIOrgDataSource {
    
    let handler : NewsHandler
    
    required init(handler: NewsHandler){
        self.handler = handler
    }
    
    
    func getNews() {
        
        let newsUrl = URL(string: ApiConstants.NewsServerURL)!
        var request = URLRequest(url: newsUrl)
        request.httpMethod = "GET"

        // This enables the app to get data even offline
        request.cachePolicy = .returnCacheDataElseLoad
        
        let httpRequestTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.handleServerResponse(data: data, response: response, error: error)
        }
        // Execute asnychronous task
        httpRequestTask.resume()
    }
    
    private func handleServerResponse(data: Data?, response: URLResponse?, error: Error?){
        // Try cast to HTTP Response
        if let httpResponse = response as? HTTPURLResponse {
            
            print("NewsApiOrgDataSource - HTTP response received - \(httpResponse.statusCode)")
            if (httpResponse.statusCode == 200) {
                                
                // Decode JSON response
                let decoder = JSONDecoder()
                do{
                    print("Trying JSON decode")
                    let newsList = try decoder.decode(NewsArticles.self, from: data!)
                    
                    if (newsList.totalResults == 0) {
                        print("NewsApiOrgDataSource - Empty list of articles")
                    } else {
                        print("NewsApiOrgDataSource - Returning data to handler")
                        // Provide data to the handler
                        handler.handleNews(news: newsList)
                    }
                    
                } catch {
                    print("NewsApiOrgDataSource - JSON Error")
                    handler.handleError(error: NAError.JSONError)
                }
            } else {
                print("NewsApiOrgDataSource - Response error code \(httpResponse.statusCode)")
                handler.handleError(error: NAError.serverError)
            }
        } else {
            print("NewsApiOrgDataSource - No response from server")
            handler.handleError(error: NAError.noResponseError)
        }
        
    }
    
    
}



