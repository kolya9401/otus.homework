//
//  ProPlayerListLocalService.swift
//  LocalStorage
//
//  Created by Nikolay on 20.06.2025.
//

import Foundation
import RealmSwift

public enum ProPlayerListLocalServiceError: Error {
    case notFound
    case cacheIsOutOfDate
}

public protocol ProPlayerListLocalService {
    func get() async -> Result<[ProPlayerDTO], ProPlayerListLocalServiceError>
    func save(players: [ProPlayerDTO])
}

final class ProPlayerListLocalServiceImpl {
    private let realmProvader: RealmProvider
    
    init(realmProvader: @escaping RealmProvider) {
        self.realmProvader = realmProvader
    }
}

extension ProPlayerListLocalServiceImpl: ProPlayerListLocalService {
    func get() async -> Result<[ProPlayerDTO], ProPlayerListLocalServiceError> {
        guard let realm = realmProvader() else {
            return .failure(.notFound)
        }
        
        guard
            let result = realm.objects(CachedProPlayersRealm.self).first,
            !result.players.isEmpty
        else {
            return .failure(.notFound)
        }
        
        let cacheDate = result.cacheDate
        let twoHours: TimeInterval = 2 * 60 * 60
        if Date().timeIntervalSince(cacheDate) > twoHours {
            return .failure(.cacheIsOutOfDate)
        }
        
        let players = result.players.map { playerRealm in
            playerRealm.converter.toProPlayerDTO()
        }
        
        return .success(Array(players))
    }
    
    func save(players: [ProPlayerDTO]) {
        guard let realm = realmProvader() else {
            return
        }
        
        guard players.isEmpty == false else { return }
        
        let proPlayers = players.map { player in
            player.converter.toProPlayerRealm()
        }
        
        let cachedProPlayers = CachedProPlayersRealm(players: proPlayers)
        
        try? realm.write {
            realm.add(cachedProPlayers, update: .modified)
        }
    }
}
