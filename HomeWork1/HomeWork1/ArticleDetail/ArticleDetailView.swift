//
//  ArticleDetailView.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 18.03.2025.
//

import SwiftUI

struct ArticleDetailView: View {
    private var article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var body: some View {
        VStack {
            Text(article.content)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            
            Spacer()
        }
        .navigationTitle(article.title)
        
    }
}
