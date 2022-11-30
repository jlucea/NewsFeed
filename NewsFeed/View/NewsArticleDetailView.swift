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

        ScrollView (.vertical, showsIndicators: true) {
        
            VStack {
                
                // Image
                if let urlStr = article.urlToImage {
                    AsyncImage(url: URL(string: urlStr),
                               content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    }, placeholder: {
                        ProgressView()
                            .aspectRatio(contentMode: .fit)
                    })
                }else{
                    // Default image
                    Image("placeholder-tech")
                        .resizable()
                        .scaledToFit()
                }
                
                // VStack containing source, title, date, description and content
                VStack (alignment: .leading, spacing: 10) {
                    
                    if let sourceStr = article.source.name {
                        Text(sourceStr)
                            .font(.callout)
                            .fontWeight(.bold)
                            .padding(.top)
                    }
                    
                    // Title
                    Text(article.title ?? "[No Title]")
                        .font(.title)
                    
                    // Description
                    if let descriptionTxt = article.description {
                        Text(descriptionTxt)
                            .font(.subheadline)
                    }
                    
                    // Author
                    if let authorStr = article.author {
                        Text(authorStr)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .padding(.top)
                    }
                    
                    // Date
                    if let dateStr = article.publishedAt {
                        Text(DateUtils.formatDate(dateStr: dateStr, showDay: true))
                            .font(.footnote)
                    }
                    
                    Divider().padding(.vertical)
                    
                    // Content
                    Text(article.content ?? "[No content]")
                        .font(.body)
                    
                }
                .padding(.horizontal)
                
            } // VStack
                                                                
        } // ScrollView
//        .background(Color.yellow)
        
    } // Body
    
} // Struct


struct Previews_NewsArticleDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let sampleArticle = NewsArticle(sourceId: "engadget", sourceName: "Engadget", author: "Kris Holt",
                        title: "Apple Music Replay gets a much-needed redesign for 2022",
                        description: "Apple Music users can now access a recap of what they’ve listened to on the service this year thanks to Apple Music Replay. Apple has redesigned the feature to make it a much sleeker experience, albeit one that perhaps isn’t quite on par with Spotify.",
                        url:"https://www.engadget.com/apple-music-replay-2022-redesign-152115957.html",
                        urlImg: "https://s.yimg.com/os/creatr-uploaded-images/2022-11/ba6b1aa0-6ff7-11ed-b4f5-d7e02a75274d",
                        date: "2022-11-30T09:10:11Z",
                        content: "DOGE short-term investors could be shorting the memecoin for gains\r\n- DOGEs current bull rally may stands under speculation\r\nNot so long ago, crypto investors showed disinterest in Dogecoin [DOGE]. I… [+970 chars]DOGE short-term investors could be shorting the memecoin for gains\r\n- DOGEs current bull rally may stands under speculation\r\nNot so long ago, crypto investors showed disinterest in Dogecoin [DOGE]. I… [+970 chars]DOGE short-term investors could be shorting the memecoin for gains\r\n- DOGEs current bull rally may stands under speculation\r\nNot so long ago, crypto investors showed disinterest in Dogecoin [DOGE]. I… [+970 chars]")
        
        NewsArticleDetailView(article: sampleArticle)
    }
}



