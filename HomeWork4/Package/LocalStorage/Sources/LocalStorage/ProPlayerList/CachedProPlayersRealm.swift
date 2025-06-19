// CachedProPlayersRealm.swift
// LocalStorage
//
// Created by Nikolay on 20.06.2025.
//

import RealmSwift
import Foundation

private extension String {
    static let cachedProPlayersSingletoneKey = "CachedProPlayersSingletoneKey"
}

final class CachedProPlayersRealm: Object {
    @Persisted(primaryKey: true) private var id: String = .cachedProPlayersSingletoneKey
    @Persisted var cacheDate: Date = Date()
    @Persisted var players: List<ProPlayerRealm>
}

extension CachedProPlayersRealm {
    convenience init(players: [ProPlayerRealm]) {
        self.init()
        self.cacheDate = Date()
        self.players.append(objectsIn: players)
    }
}
