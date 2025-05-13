//
//  DependencyContainer.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import ProPlayersNetworkService

public final class DependencyContainer {
    private let networkServiceDependencyContainer: NetworkServiceDependencyContainer
    
    private init() {
        self.networkServiceDependencyContainer = .shared
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
    
