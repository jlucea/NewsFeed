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
            
            // Title
            Text(article.title ?? "[No Title]")
                .multilineTextAlignment(.center)
                .font(.title2)
                .padding(.horizontal)
            
            // Image
            if let urlStr = article.urlToImage {
                AsyncImage(url: URL(string: urlStr),
                           content: {image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 240)
                },
                placeholder: {
                    ProgressView()
                })
                .padding(.horizontal)
                
            }else{
                // Default image
                Image("placeholder-tech")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 240)
            }

            // Date
            if let dateStr = article.publishedAt {
                Text(DateUtils.formatDate(dateStr: dateStr))
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    // .background(.yellow)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            VStack (alignment: .leading){
                // Content
                Text(article.description ?? "[No content]")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    // .background(.blue)
                    .multilineTextAlignment(.leading)
                    .padding()
            }
            // .background(.red)
            
        }// .background(.gray)
    }
    
}


struct Previews_NewsArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let sampleArticle : NewsArticle = NewsArticle(sourceId: "X", sourceName: "XX", author: "Jaime Lucea", title: "Sample News Article Title", description: "This is an article", url: "urlString goes here", urlImg: "https://cdn.vox-cdn.com/thumbor/GGoKE-8sn4L8UWV6-Q6SAroILfQ=/0x38:1920x1043/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/23647688/pheonix.png",date: "2022-06-23T21:12:03Z" , content: "Developer Motion Twin announced that the rogue-lite will be getting a major update on Thursday. The Breaking Barriers update will be adding new difficulties and accessibility features like assist mode.")
        
        NewsArticleDetailView(article: sampleArticle)
    }
}



