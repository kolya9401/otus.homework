//
//  Router.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 18.03.2025.
//

import SwiftUI

final class Router: ObservableObject {
    enum Tab {
        case news
        case all
        case subscription
    }
    
    @Published var articleListPath: [Article] = []
    @Published var currentTab: Tab = .news
}

extension Router {
    func openArticle(article: Article) {
        currentTab = .all
        if articleListPath.last != article {
            articleListPath.append(article)
        }
    }
}
