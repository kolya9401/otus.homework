//
//  ProPlayerRealm.swift
//  LocalStorage
//
//  Created by Nikolay on 20.06.2025.
//

import RealmSwift

final class ProPlayerRealm: Object {
    @Persisted(primaryKey: true) var accountId: Int
    @Persisted var steamid: String = ""
    @Persisted var avatar: String? // URL как строка
    @Persisted var avatarmedium: String?
    @Persisted var avatarfull: String?
    @Persisted var steamProfile: String?
    @Persisted var steamName: String?
    @Persisted var name: String = ""
    @Persisted var fantasyRole: Int?
    @Persisted var team: TeamRealm?
}

final class TeamRealm: EmbeddedObject {
    @Persisted var id: Int
    @Persisted var name: String = ""
    @Persisted var tag: String = ""
}
