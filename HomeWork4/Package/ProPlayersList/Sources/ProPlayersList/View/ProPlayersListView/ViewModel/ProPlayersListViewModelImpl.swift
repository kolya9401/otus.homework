//
//  ProPlayersListViewModelImpl.swift
//  ProPlayersList
//
//  Created by Nikolay on 13.05.2025.
//

import Foundation

final class ProPlayersListViewModelImpl  {
    @Published var state: ProPlayersListViewModelState = .loading
    
    private let reposytory: ProPlayersListReposytory
    private let favoritesProPlayerLocalProvider: FavoritesProPlayerLocalProvider
    private var players: [ProPlayer] = []
    
    init(
        reposytory: ProPlayersListReposytory,
        favoritesProPlayerLocalProvider: FavoritesProPlayerLocalProvider
    ) {
        self.reposytory = reposytory
        self.favoritesProPlayerLocalProvider = favoritesProPlayerLocalProvider
    }
}

extension ProPlayersListViewModelImpl: ProPlayersListViewModel {
    func load() {
        state = .loading
        
        Task {
            let result = await self.reposytory.get()
            self.applyResult(result: result)
        }
    }
    
    func toggleFavorite(player: ProPlayerViewModel) {
        guard let proPlayer = players.first(where: { $0.accountId == player.id }) else { return }
        
        favoritesProPlayerLocalProvider.toggleFavoriteProPlayer(proPlayer)
    }
}

private extension ProPlayersListViewModelImpl {
    @MainActor
    func applyResult(result: Result<[ProPlayer], Error>) {
        switch result {
        case let .success(players):
            self.players = players
            let playersViewModel = players
                .map { ProPlayerViewModel(player: $0) }
            self.state = .loaded(playersViewModel)
        case let .failure(error):
            self.state = .error(error.localizedDescription)
        }
    }
}
