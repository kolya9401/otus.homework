//
//  ArticleListViewModel.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 18.03.2025.
//

import Foundation

final class ArticleListViewModel: ObservableObject {
    private let articalStorage: ArticleStorage
    @Published var articles: [Article] = []
    
    init(articalStorage: ArticleStorage) {
        self.articalStorage = articalStorage
    }
    
    func loadArticles() {
        articles = articalStorage.getArticles()
    }
}
