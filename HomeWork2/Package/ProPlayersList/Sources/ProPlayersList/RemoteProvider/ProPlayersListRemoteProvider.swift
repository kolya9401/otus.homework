//
//  ProPlayersListRemoteProvider.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import Foundation
import ProPlayersNetworkService

protocol ProPlayersListRemoteProvider: Sendable {
    func get() async -> Result<[ProPlayer], Error>
}

final class ProPlayersListRemoteProviderImpl {
    private let networkService: ProPlayerListNetworkService
    
    init(networkService: ProPlayerListNetworkService) {
        self.networkService = networkService
    }
}

// MARK: - ProPlayersListRemoteProvider
extension ProPlayersListRemoteProviderImpl: ProPlayersListRemoteProvider {
    func get() async -> Result<[ProPlayer], Error> {
        await networkService.get()
            .map { players in
                players.compactMap { $0.tryConvertToProPlayer() }
            }
    }
}

private extension ProPlayerNTO {
    func tryConvertToProPlayer() -> ProPlayer? {
        guard
            let accountId = self.accountId,
            let steamid = self.steamid
        else {
            return nil
        }
        
        let team: ProPlayer.Team? = {
            guard
                let teamId = self.teamId,
                let name = self.teamName,
                let tag = self.teamTag
            else { return nil }
            
            return .init(
                id: teamId,
                name: name,
                tag: tag
            )
        }()
        
        return .init(
            accountId: accountId,
            steamid: steamid,
            avatar: self.avatar?.tryConvertToURL(),
            avatarmedium: self.avatarmedium?.tryConvertToURL(),
            avatarfull: self.avatarfull?.tryConvertToURL(),
            steamProfile: self.profileurl?.tryConvertToURL(),
            steamName: self.personaname,
            name: self.name ?? "",
            fantasyRole: self.fantasyRole,
            team: team
        )
    }
}

private extension String {
    func tryConvertToURL() -> URL? {
        URL(string: self)
    }
}
