//
//  ArticleCell.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 26/6/22.
//

import SwiftUI

struct NewsArticleCell : View {
    
    var article: NewsArticle
    
    var body: some View {
        HStack {
            
            if let urlStr = article.urlToImage {
                AsyncImage(
                    url: URL(string: urlStr),
                    content: {image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90)
                    },
                    placeholder: {
                        ProgressView()
                            .frame(width: 90)
                    })
            }else{
                Image("placeholder-mediumgrey")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90)
                    .cornerRadius(2)
            }
            
            VStack (alignment: .leading, spacing: 4){
                // Title
                Text(article.title ?? "(no title)")
                    .fontWeight(.semibold)
                    .lineLimit(1)
                
                // Extract
                Text(article.content ?? "(no content)")
                    .font(.subheadline)
                    .lineLimit(3)
                    .foregroundColor(.secondary)
            }
        }
    }
}

