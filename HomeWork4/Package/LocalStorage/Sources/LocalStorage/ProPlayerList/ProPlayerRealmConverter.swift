//
//  ProPlayerRealmConverter.swift
//  LocalStorage
//
//  Created by Nikolay on 20.06.2025.
//

import Foundation

final class ProPlayerRealmConverter {
    private let proPlayer: ProPlayerRealm
    
    init(proPlayer: ProPlayerRealm) {
        self.proPlayer = proPlayer
    }
}

extension ProPlayerRealmConverter {
    func toProPlayerDTO() -> ProPlayerDTO {
        let teamDTO: ProPlayerDTO.TeamDTO? = proPlayer.team.flatMap { team in
            ProPlayerDTO.TeamDTO(
                id: team.id,
                name: team.name,
                tag: team.tag
            )
        }
        return ProPlayerDTO(
            accountId: proPlayer.accountId,
            steamid: proPlayer.steamid,
            avatar: proPlayer.avatar.flatMap(URL.init(string:)),
            avatarmedium: proPlayer.avatarmedium.flatMap(URL.init(string:)),
            avatarfull: proPlayer.avatarfull.flatMap(URL.init(string:)),
            steamProfile: proPlayer.steamProfile.flatMap(URL.init(string:)),
            steamName: proPlayer.steamName,
            name: proPlayer.name,
            fantasyRole: proPlayer.fantasyRole,
            team: teamDTO
        )
    }
}

extension ProPlayerRealm {
    var converter: ProPlayerRealmConverter {
        .init(proPlayer: self)
    }
}
