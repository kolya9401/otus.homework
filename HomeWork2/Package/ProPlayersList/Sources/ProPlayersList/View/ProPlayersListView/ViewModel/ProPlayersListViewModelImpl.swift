//
//  ProPlayersListViewModelImpl.swift
//  ProPlayersList
//
//  Created by Nikolay on 13.05.2025.
//

import Foundation

final class ProPlayersListViewModelImpl  {
    @Published var state: ProPlayersListViewModelState = .loading
    
    private let remoteProvider: ProPlayersListRemoteProvider
    
    init(remoteProvider: ProPlayersListRemoteProvider) {
        self.remoteProvider = remoteProvider
    }
}

extension ProPlayersListViewModelImpl: ProPlayersListViewModel {
    func load() {
        state = .loading
        
        Task {
            let result = await self.remoteProvider.get()
            self.applyResult(result: result)
        }
    }
}

private extension ProPlayersListViewModelImpl {
    @MainActor
    func applyResult(result: Result<[ProPlayer], Error>) {
        switch result {
        case let .success(players):
            let players = players
                .map { ProPlayerViewModel(player: $0) }
            self.state = .loaded(players)
        case let .failure(error):
            self.state = .error(error.localizedDescription)
        }
    }
}
