//
//  DependencyContainer.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

public final class DependencyContainer {
    private let proPlayersListRemoteProvider: ProPlayersListRemoteProvider = ProPlayersListRemoteProviderImpl()
    
    private init() {
        
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
    
