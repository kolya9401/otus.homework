//
//  RootView.swift
//  HomeWork1
//
//  Created by Nikolay Zhaboedov on 17.03.2025.
//

import SwiftUI

struct RootView: View {
    struct TabLabel: View {
        private let label: String
        private let systemName: String
        
        init(
            label: String,
            systemName: String
        ) {
            self.label = label
            self.systemName = systemName
        }
        
        var body: some View {
            VStack {
                Image(systemName: systemName)
                Text(label)
            }
        }
    }
    
    @StateObject private var router = Router()

    var body: some View {
        TabView(selection: $router.currentTab) {
            Tab(
                value: .news,
                content: { NewArticleView(router: router) },
                label: { TabLabel(label: "News", systemName: "newspaper") }
            )
            
            Tab(
                value: .all,
                content: { ArticleListView(router: router) },
                label: { TabLabel(label: "All", systemName: "list.bullet") }
            )
            
            Tab(
                value: .subscription,
                content: { SubscribeView() },
                label: { TabLabel(label: "Subscribe", systemName: "envelope") }
            )
        }
    }
}

#Preview {
    RootView()
}
