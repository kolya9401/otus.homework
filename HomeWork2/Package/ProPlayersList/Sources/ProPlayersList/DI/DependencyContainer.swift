//
//  DependencyContainer.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

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
}

public extension DependencyContainer {
    static func make() -> DependencyContainer {
        .init()
    }
}

public extension DependencyContainer {
    @MainActor func make() -> ProPlayersListView {
        ProPlayersListView(viewModel: .init(remoteProvider: proPlayersListRemoteProvider))
    }
}
    
