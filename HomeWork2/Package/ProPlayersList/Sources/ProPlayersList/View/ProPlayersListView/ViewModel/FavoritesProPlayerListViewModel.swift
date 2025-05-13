//
//  ProPlayersListViewModelImpl 2.swift
//  ProPlayersList
//
//  Created by Nikolay on 13.05.2025.
//


import Foundation

final class FavoritesProPlayerListViewModel  {
    @Published var state: ProPlayersListViewModelState = .loading
    
    private let localProvider: FavoritesProPlayerLocalProvider
    
    init(localProvider: FavoritesProPlayerLocalProvider) {
        self.localProvider = localProvider
    }
}

extension FavoritesProPlayerListViewModel: ProPlayersListViewModel {
    func load() {
        state = .loading
        
        let favoritesProPlayerViewModels = localProvider.getFavoritesProPlayers()
            .map { ProPlayerViewModel(player: $0) }
        
        state = .loaded(favoritesProPlayerViewModels)
    }
}

private extension FavoritesProPlayerListViewModel {
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
