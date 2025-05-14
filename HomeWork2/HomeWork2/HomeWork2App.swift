//
//  HomeWork2App.swift
//  HomeWork2
//
//  Created by Nikolay Zhaboedov on 14.04.2025.
//

import SwiftUI
import ProPlayersList
import LocalStorage

private let di = DependencyContainer.make()
private let onboardingStatusProvider: OnboardingStatusProvider = di.makeOnboardingStatusProvider()

@main
struct HomeWork2App: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                proPlayerListView: di.makeProPlayersListView(),
                favoriteProPlayerListView: di.makeFavoritesProPlayerListView(),
                onboardingBuilder: { onTapToStartApp in
                    let onboardingView = di.makeOnboardingView(onTapToStartApp: onTapToStartApp)
                    
                    return AnyView(onboardingView)
                },
                onboardingStatusProvider: onboardingStatusProvider
            )
        }
    }
}
