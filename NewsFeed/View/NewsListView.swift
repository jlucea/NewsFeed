//
//  NewsListView.swift
//  NewsFeed
//
//  Created by Jaime Lucea on 23/6/22.
//

import SwiftUI

struct NewsListView: View {

    @StateObject private var viewModel = NewsHandler()
    @State var searchingFor = ""
    
    var body: some View {
        
        VStack {
            NavigationView {
                List{
                    ForEach(results, id: \.self){ article in
                        NavigationLink(destination: NewsArticleDetailView(article: article), label: {
                            NewsArticleCell(article: article)
                        })
                    }
                }
                .searchable(text: $searchingFor)
                .navigationTitle("News")
            }
            .navigationViewStyle(.stack)
            .onAppear() {
                viewModel.getNews()
            }
        }
        
        .alert(item: $viewModel.alertItem) { alertitem in
            Alert(title: alertitem.title, message: alertitem.message, dismissButton: alertitem.dismissButton)
        }
    }
    
    
    var results : [NewsArticle] {
        if searchingFor.isEmpty {
            return viewModel.newsArticles
        } else {
            return viewModel.newsArticles.filter {
                $0.title!.contains(searchingFor)
            }
        }
    }
    
}

struct NewsListView_Previews: PreviewProvider {
    
    static var previews: some View {
        NewsListView()
    }
}



