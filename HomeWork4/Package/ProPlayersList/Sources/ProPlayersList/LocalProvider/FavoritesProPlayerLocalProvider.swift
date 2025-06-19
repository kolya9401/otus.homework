//
//  FavoritesProPlayerLocalProvider.swift
//  ProPlayersList
//
//  Created by Nikolay on 13.05.2025.
//

import LocalStorage

protocol FavoritesProPlayerLocalProvider {
    func getFavoritesProPlayers() -> [ProPlayer]
    
    func toggleFavoriteProPlayer(_ player: ProPlayer)
    
    func checkIsFavoriteProPlayer(_ proPlayer: ProPlayer) -> Bool
}

final class FavoritesProPlayerLocalProviderImpl {
    private let localService: FavoritesProPlayerLocalService
    
    init(localService: FavoritesProPlayerLocalService) {
        self.localService = localService
    }
}

extension FavoritesProPlayerLocalProviderImpl: FavoritesProPlayerLocalProvider {
    func getFavoritesProPlayers() -> [ProPlayer] {
        localService.getAllFavoriteProPlayers()
            .map { $0.convertToProPlayer() }
    }
    
    func appendFavoriteProPlayer(_ proPlayer: ProPlayer) {
        let dto = proPlayer.convertToDTO()
        
        localService.appendFavoriteProPlayer(dto)
    }
    
    func toggleFavoriteProPlayer(_ player: ProPlayer) {
        let dto = player.convertToDTO()
        
        if checkIsFavoriteProPlayer(player) {
            localService.removeFavoriteProPlayer(dto)
        } else {
            localService.appendFavoriteProPlayer(dto)
        }
    }
    
    func removeFavoriteProPlayer(_ proPlayer: ProPlayer) {
        let dto = proPlayer.convertToDTO()

        localService.removeFavoriteProPlayer(dto)
    }
    
    func checkIsFavoriteProPlayer(_ proPlayer: ProPlayer) -> Bool {
        getFavoritesProPlayers().contains(where: { $0.accountId == proPlayer.accountId })
    }
}
