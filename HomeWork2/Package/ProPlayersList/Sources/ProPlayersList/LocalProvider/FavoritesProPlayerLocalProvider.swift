//
//  FavoritesProPlayerLocalProvider.swift
//  ProPlayersList
//
//  Created by Nikolay on 13.05.2025.
//

import LocalStorage

protocol FavoritesProPlayerLocalProvider {
    func getFavoritesProPlayers() -> [ProPlayer]
    func appendFavoriteProPlayer(_ proPlayer: ProPlayer)
    
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
    
    func checkIsFavoriteProPlayer(_ proPlayer: ProPlayer) -> Bool {
        getFavoritesProPlayers().contains(where: { $0.accountId == proPlayer.accountId })
    }
}

private extension ProPlayerDTO {
    func convertToProPlayer() -> ProPlayer {
        .init(
            accountId: self.accountId,
            steamid: self.steamid,
            avatar: self.avatar,
            avatarmedium: self.avatarmedium,
            avatarfull: self.avatarfull,
            steamProfile: self.steamProfile,
            steamName: self.steamName,
            name: self.name,
            fantasyRole: self.fantasyRole,
            team: self.team.flatMap {
                .init(
                    id: $0.id,
                    name: $0.name,
                    tag: $0.tag
                )
            }
        )
    }
}
    

private extension ProPlayer {
    func convertToDTO() -> ProPlayerDTO {
        .init(
            accountId: self.accountId,
            steamid: self.steamid,
            avatar: self.avatar,
            avatarmedium: self.avatarmedium,
            avatarfull: self.avatarfull,
            steamProfile: self.steamProfile,
            steamName: self.steamName,
            name: self.name,
            fantasyRole: self.fantasyRole,
            team: self.team.flatMap {
                .init(
                    id: $0.id,
                    name: $0.name,
                    tag: $0.tag
                )
            }
        )
    }
}
