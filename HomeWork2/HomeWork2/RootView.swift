//
//  RootView.swift
//  HomeWork2
//
//  Created by Nikolay on 13.05.2025.
//

import SwiftUI
import LocalStorage

struct RootView: View {
    typealias OnboardingBuilder = (_ onTapToStartApp: @escaping () -> Void) -> AnyView
    
    private let proPlayerListView: AnyView
    private let favoriteProPlayerListView: AnyView
    private let onboardingBuilder: OnboardingBuilder
    private let onboardingStatusProvider: OnboardingStatusProvider
    @State private var isOnboardingCompleted: Bool

    init(
        proPlayerListView: some View,
        favoriteProPlayerListView: some View,
        onboardingBuilder: @escaping OnboardingBuilder,
        onboardingStatusProvider: OnboardingStatusProvider
    ) {
        self.proPlayerListView = AnyView(proPlayerListView)
        self.favoriteProPlayerListView = AnyView(favoriteProPlayerListView)
        self.onboardingBuilder = onboardingBuilder
        self.onboardingStatusProvider = onboardingStatusProvider
        self.isOnboardingCompleted = onboardingStatusProvider.checkIsOnboardingCompleted()
    }
    
    var body: some View {
        if isOnboardingCompleted {
            makeMainView()
        } else {
            onboardingBuilder {
                onboardingStatusProvider.setOnboardingCompleted()
                isOnboardingCompleted = true
            }
        }
    }
}

private extension RootView {
    func makeMainView() -> some View {
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
