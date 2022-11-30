//
//  NewsHandler.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 23/6/22.
//

import Foundation

final class NewsHandler : ObservableObject {
    
    private static let API_KEY = "dcc2b2fcf1744e7badbe1ee2fa2a2c4e"
    private static let COUNTRY = "us"
    private static let CATEGORY = "technology"
    private static let NEWSAPI_URL = "https://newsapi.org/v2/top-headlines?country=\(COUNTRY)&category=\(CATEGORY)&apiKey=" + API_KEY
    
    @Published var alertItem: AlertItem?
    @Published var newsArticles : [NewsArticle] = []
    
    func getNews(){
        
        var request = URLRequest(url: URL(string: NewsHandler.NEWSAPI_URL)!)
        request.httpMethod = "GET"

        // Cache policy
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        let httpRequestTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.handleResponse(data: data, response: response, error: error)
        }
        // Execute asnychronous task
        httpRequestTask.resume()
    }
    
    
    private func handleResponse(data: Data?, response: URLResponse?, error: Error?){
        // Try cast to HTTP Response
        if let httpResponse = response as? HTTPURLResponse {
            
            print("HTTP response received - \(httpResponse.statusCode)")
            if (httpResponse.statusCode == 200) {
                                
                // Decode JSON response
                let decoder = JSONDecoder()
                do{
                    print("Trying JSON decode")
                    let newsList = try decoder.decode(NewsArticles.self, from: data!)
                    
                    if (newsList.totalResults == 0) {
                        print("Empty list of articles")
                    } else {
                        print("Returning data to handler")
                        // Provide data to the handler
                        self.handleNews(news: newsList)
                    }
                    
                } catch {
                    print("JSON Error")
                    self.handleError(error: NAError.JSONError)
                }
            } else {
                print("Response error code \(httpResponse.statusCode)")
                self.handleError(error: NAError.serverError)
            }
        } else {
            print("No response from server")
            self.handleError(error: NAError.noResponseError)
        }
    }
    
    func handleNews(news: NewsArticles){
        print("Handling received data. Received \(news.totalResults) news articles")
        
        // Data values are published from the main thread
        DispatchQueue.main.async { () -> Void in
            self.newsArticles = news.articles
        }
    }
    
    func handleError(error: NAError){
        switch error {
        case .JSONError:
            alertItem = AlertContext.invalidData
        case .serverError:
            alertItem = AlertContext.serverError
        case .noResponseError:
            alertItem = AlertContext.noResponse
        case .unknownError:
            alertItem = AlertContext.unknownError
        }
    }
    
}
