//
//  ProPlayer+Converter.swift
//  ProPlayersList
//
//  Created by Nikolay on 20.06.2025.
//

import LocalStorage

extension ProPlayer {
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
