//
//  ArticleListView.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 18.03.2025.
//

import SwiftUI

struct ArticleListView: View {
    @StateObject private var viewModel = ArticleListViewModel(articalStorage: .init())
    @ObservedObject private var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    var body: some View {
        NavigationStack(path: $router.articleListPath) {
            List(viewModel.articles) { article in
                NavigationLink(value: article) {
                    Text(article.title)
                }
            }
            .navigationTitle("Articles")
            .onAppear() {
                viewModel.loadArticles()
            }
            .navigationDestination(for: Article.self) { article in
                ArticleDetailView(article: article)
            }
        }
    }
}
