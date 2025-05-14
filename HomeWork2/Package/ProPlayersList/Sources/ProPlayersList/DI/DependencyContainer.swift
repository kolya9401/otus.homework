//
//  DependencyContainer.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import SwiftUI
import ProPlayersNetworkService
import LocalStorage
import Onboarding

public final class DependencyContainer {
    private let networkServiceDependencyContainer: NetworkServiceDependencyContainer
    private let localStorageDependencyContainer: LocalStorageDependencyContainer
    private let onboardingDependencyContainer: OnboardingDependencyContainer
    
    private init() {
        self.networkServiceDependencyContainer = .shared
        self.localStorageDependencyContainer = .shared
        self.onboardingDependencyContainer = .shared
    }
}

extension DependencyContainer {
    var proPlayersListRemoteProvider: ProPlayersListRemoteProvider {
        ProPlayersListRemoteProviderImpl(
            networkService: networkServiceDependencyContainer.makeProPlayerListNetworkService()
        )
    }
    
    var favoritesProPlayerLocalProvider: FavoritesProPlayerLocalProvider {
        FavoritesProPlayerLocalProviderImpl(
            localService: localStorageDependencyContainer.makeFavoritesProPlayerLocalService()
        )
    }
}

public extension DependencyContainer {
    static func make() -> DependencyContainer {
        .init()
    }
}

public extension DependencyContainer {
    func makeOnboardingStatusProvider() -> OnboardingStatusProvider {
        localStorageDependencyContainer.makeOnboardingStatusProvider()
    }
}

// MARK: UI
public extension DependencyContainer {
    @MainActor func makeProPlayersListView() -> some View {
        let viewModel = ProPlayersListViewModelImpl(
            remoteProvider: proPlayersListRemoteProvider,
            favoritesProPlayerLocalProvider: favoritesProPlayerLocalProvider
        )
        
        return ProPlayersListView(viewModel: viewModel)
    }
    
    @MainActor func makeFavoritesProPlayerListView() -> some View {
        let viewModel = FavoritesProPlayerListViewModel(
            localProvider: favoritesProPlayerLocalProvider
        )
        
        return ProPlayersListView(viewModel: viewModel)
    }
    
    @MainActor func makeOnboardingView(onTapToStartApp: @escaping () -> Void) -> some View {
        onboardingDependencyContainer.makeOnboardingView(onTapToStartApp: onTapToStartApp)
    }
}
    
