//
//  NewsListView.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 23/6/22.
//

import SwiftUI
import CoreData

struct NewsListView: View {

    @StateObject private var viewModel = NewsHandler()

    var body: some View {
        
        VStack {
            
            NavigationView {
                List(viewModel.newsArticles, id: \.id) { article in
                    NavigationLink(destination: NewsArticleDetailView(article: article), label: {
                        NewsArticleCell(article: article)
                    })
                }
                .navigationTitle("News")
            }
            .onAppear() { viewModel.getNews() }
        }
        
        /*
        .alert(title: $alertItem) {
            Alert(title: alertItem)
        }
        */
    }
    
}

