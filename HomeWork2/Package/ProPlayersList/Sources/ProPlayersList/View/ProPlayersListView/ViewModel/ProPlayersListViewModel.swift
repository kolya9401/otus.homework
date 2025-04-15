//
//  ProPlayersListViewModel.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import Foundation

final class ProPlayersListViewModel: ObservableObject {
    enum State {
        case loading
        case loaded([ProPlayerViewModel])
        case error(String)
    }
    
    @Published var state: State = .loading
    
    private let remoteProvider: ProPlayersListRemoteProvider
    
    init(remoteProvider: ProPlayersListRemoteProvider) {
        self.remoteProvider = remoteProvider
    }
}

extension ProPlayersListViewModel {
    @MainActor
    func load() {
        state = .loading
        
        Task {
            let result = await self.remoteProvider.get()
            self.applyResult(result: result)
        }
    }
}

private extension ProPlayersListViewModel {
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
