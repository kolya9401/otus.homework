//
//  RootView.swift
//  HomeWork2
//
//  Created by Nikolay on 13.05.2025.
//

import SwiftUI

struct RootView: View {
    private let proPlayerListView: AnyView
    private let favoriteProPlayerListView: AnyView
    
    init(
        proPlayerListView: some View,
        favoriteProPlayerListView: some View
    ) {
        self.proPlayerListView = AnyView(proPlayerListView)
        self.favoriteProPlayerListView = AnyView(favoriteProPlayerListView)
    }
    
    var body: some View {
        TabView {
            Tab(
                content: { proPlayerListView },
                label: { Image(systemName: "list.bullet") }
            )
            
            Tab(
                content: { favoriteProPlayerListView },
                label: { Image(systemName: "star.fill") }
            )
        }
    }
}
