//
//  ProPlayerDTOConverter.swift
//  LocalStorage
//
//  Created by Nikolay on 20.06.2025.
//

final class ProPlayerDTOConverter {
    private let player: ProPlayerDTO
    
    init(player: ProPlayerDTO) {
        self.player = player
    }
}

extension ProPlayerDTOConverter {
    func toProPlayerRealm() -> ProPlayerRealm {
        let realmPlayer = ProPlayerRealm()
        realmPlayer.accountId = player.accountId
        realmPlayer.steamid = player.steamid
        realmPlayer.avatar = player.avatar?.absoluteString
        realmPlayer.avatarmedium = player.avatarmedium?.absoluteString
        realmPlayer.avatarfull = player.avatarfull?.absoluteString
        realmPlayer.steamProfile = player.steamProfile?.absoluteString
        realmPlayer.steamName = player.steamName
        realmPlayer.name = player.name
        realmPlayer.fantasyRole = player.fantasyRole
        if let teamDTO = player.team {
            let teamRealm = TeamRealm()
            teamRealm.id = teamDTO.id
            teamRealm.name = teamDTO.name
            teamRealm.tag = teamDTO.tag
            realmPlayer.team = teamRealm
        }
        return realmPlayer
    }
}

extension ProPlayerDTO {
    var converter: ProPlayerDTOConverter {
        .init(player: self)
    }
}
