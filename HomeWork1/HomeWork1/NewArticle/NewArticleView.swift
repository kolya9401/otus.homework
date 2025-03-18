//
//  NewArticleView.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 18.03.2025.
//

import SwiftUI

struct NewArticleView: View {
    @StateObject private var viewModel = NewArticleViewModel(articalStorage: .init())
    @ObservedObject private var router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    var body: some View {
        NavigationStack {
            NewArticleButton(title: viewModel.newArticle.title) {
                router.openArticle(article: viewModel.newArticle)
            }
            .navigationTitle("New Article")
        }
    }
}
