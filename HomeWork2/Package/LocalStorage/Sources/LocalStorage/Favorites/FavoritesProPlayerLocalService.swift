//
//  FavoritesProPlayerLocalService.swift
//  LocalStorage
//
//  Created by Nikolay on 13.05.2025.
//

public protocol FavoritesProPlayerLocalService {
    func getAllFavoriteProPlayers() -> [ProPlayerDTO]
    func appendFavoriteProPlayer(_ proPlayer: ProPlayerDTO)
}

final class FavoritesProPlayerLocalServiceImpl {
    private let keyValueStorage: UserKeyValueStorage
    private let key = "favoriteProPlayers"
    
    init(keyValueStorage: UserKeyValueStorage) {
        self.keyValueStorage = keyValueStorage
    }
}

extension FavoritesProPlayerLocalServiceImpl: FavoritesProPlayerLocalService {
    func getAllFavoriteProPlayers() -> [ProPlayerDTO] {
        keyValueStorage.value(forKey: key) ?? []
    }
    
    func appendFavoriteProPlayer(_ proPlayer: ProPlayerDTO) {
        let favoriteProPlayers: [ProPlayerDTO] = getAllFavoriteProPlayers() + [proPlayer]
        keyValueStorage.setValue(favoriteProPlayers, forKey: key)
    }
}
