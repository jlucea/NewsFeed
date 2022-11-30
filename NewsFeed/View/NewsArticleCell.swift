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
        VStack (spacing: 14){
            // Article image, loaded asynchronously from the URL.
            // There are two placeholders: one that is used while the image is being loaded
            // another in case it couldn't be loaded
            if let urlStr = article.urlToImage {
                AsyncImage(
                    url: URL(string: urlStr),
                    content: {image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                    },
                    // Image placeholder while the image is being loaded
                    placeholder: {
                        ProgressView()
                    })
                
            }
            
            // This vStack shows the title, date and author of the article
            VStack (alignment: .leading, spacing: 16){
                
                // Title
                Text(article.title ?? "(no title)")
                    .fontWeight(.medium)
                    .lineLimit(3)
                
                HStack {
                    // Author
                    if let authorString = article.author {
                        Text(authorString)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .lineLimit(1)
                    }
                    Spacer()
                    // Date
                    if let dateString = article.publishedAt {
                        let formatedDateString = DateUtils.formatDate(dateStr: dateString, showDay: false)
                        // Date
                        Text(formatedDateString)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
        } // Main VStack
        .padding(.vertical, 10)
    }
}

struct NewsArticleCell_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let article = NewsArticle(sourceId: "engadget", sourceName: "Engadget", author: "Kris Holt",
                        title: "Apple Music Replay gets a much-needed redesign for 2022",
                        description: "Apple Music\r\n users can now access a recap of what they’ve listened to on the service this year thanks to Apple Music Replay\r\n. Apple has redesigned the feature\r\n to make it a much sleeker experience, albeit one that perhaps isn’t quite on par with Spotify Wr…",
                        url:"https://www.engadget.com/apple-music-replay-2022-redesign-152115957.html",
                        urlImg: "https://s.yimg.com/os/creatr-uploaded-images/2022-11/ba6b1aa0-6ff7-11ed-b4f5-d7e02a75274d",
                        date: "2022-11-30T09:10:11Z",
                        content: "DOGE short-term investors could be shorting the memecoin for gains\r\n- DOGEs current bull rally may stands under speculation\r\nNot so long ago, crypto investors showed disinterest in Dogecoin [DOGE]. I… [+970 chars]")
        
        NewsArticleCell(article: article)
    }
}
