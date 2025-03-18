//
//  NewArticleViewModel.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 18.03.2025.
//

import SwiftUI

final class NewArticleViewModel: ObservableObject {
    private let articalStorage: ArticleStorage
    
    @Published var newArticle: Article
    
    init(articalStorage: ArticleStorage) {
        self.articalStorage = articalStorage
        self.newArticle = articalStorage.getNewArticle()
    }
}
