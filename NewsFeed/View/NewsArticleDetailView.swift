//
//  NewsArticleDetailView.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 23/6/22.
//

import SwiftUI

struct NewsArticleDetailView: View {
    
    var article: NewsArticle
    
    var body: some View {
        VStack (alignment: .leading, spacing: 1) {
            // Title
            Text(article.title ?? "[No Title]")
                .bold()
                .padding(.horizontal)
            
            // Image
            if let urlStr = article.urlToImage {
                AsyncImage(url: URL(string: urlStr),
                           content: {image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                },
                placeholder: {
                    ProgressView()
                })
                .padding(.horizontal)
            }else {
                // Default image
                Image("placeholder-tech")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }

            // Date
            if let dateStr = article.publishedAt {
                Text(formatDate(dateStr: dateStr))
                    .padding(.horizontal)
            }
                        
            // Content
            Text(article.content ?? "[No content]")
                .padding(.horizontal)
        }
    }
    
    func formatDate(dateStr: String) -> String {
        let dateFormatterIn = DateFormatter()
        dateFormatterIn.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatterIn.date(from: dateStr){
            let dateFormatterOut = DateFormatter()
            dateFormatterOut.locale = Locale(identifier: "en_US")
            dateFormatterOut.dateFormat = "EEEE, MMM d, yyyy"
            return dateFormatterOut.string(from: date)
        }else{
            return ""
        }
    }
    
    
}

