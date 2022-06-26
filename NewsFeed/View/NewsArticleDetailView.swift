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
        VStack {
            Text(article.title ?? "[No Title]")
                .bold()
                .padding(.horizontal)
            
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
                Image("sample-image")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            Text(article.publishedAt ?? "[No date]")
            Text(article.content ?? "[No content]")
                .padding(.horizontal)
        }
    }
}

