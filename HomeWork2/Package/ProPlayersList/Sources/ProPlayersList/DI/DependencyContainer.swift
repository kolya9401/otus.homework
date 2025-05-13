//
//  DependencyContainer.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import SwiftUI
import ProPlayersNetworkService
import LocalStorage

public final class DependencyContainer {
    private let networkServiceDependencyContainer: NetworkServiceDependencyContainer
    private let localStorageDependencyContainer: LocalStorageDependencyContainer
    
    private init() {
        self.networkServiceDependencyContainer = .shared
        self.localStorageDependencyContainer = .shared
    }
}

extension DependencyContainer {
    var proPlayersListRemoteProvider: ProPlayersListRemoteProvider {
        ProPlayersListRemoteProviderImpl(
            networkService: networkServiceDependencyContainer.makeProPlayerListNetworkService()
        )
    }
    
    var favoritesProPlayerLocalProvider: FavoritesProPlayerLocalProvider {
        FavoritesProPlayerLocalProviderImpl(localService: localStorageDependencyContainer.make())
    }
}

public extension DependencyContainer {
    static func make() -> DependencyContainer {
        .init()
    }
}

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
}
    
