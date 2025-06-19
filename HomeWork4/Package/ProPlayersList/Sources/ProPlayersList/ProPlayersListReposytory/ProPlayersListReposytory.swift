//
//  ProPlayersListReposytory.swift
//  ProPlayersList
//
//  Created by Nikolay on 20.06.2025.
//

import LocalStorage

protocol ProPlayersListReposytory {
    func get() async -> Result<[ProPlayer], Error>
}

final class ProPlayersListReposytoryImpl {
    private let proPlayerListLocalService: ProPlayerListLocalService
    private let proPlayersListRemoteProvider: ProPlayersListRemoteProvider
    
    init(
        proPlayerListLocalService: ProPlayerListLocalService,
        proPlayersListRemoteProvider: ProPlayersListRemoteProvider
    ) {
        self.proPlayerListLocalService = proPlayerListLocalService
        self.proPlayersListRemoteProvider = proPlayersListRemoteProvider
    }
}

extension ProPlayersListReposytoryImpl: ProPlayersListReposytory {
    func get() async -> Result<[ProPlayer], Error> {
        let localResult = await proPlayerListLocalService.get()
        switch localResult {
        case .success(let dtos):
            // Make sure to implement ProPlayer.init(dto: ProPlayerDTO)
            let players = dtos.compactMap { $0.convertToProPlayer() }
            return .success(players)
        case .failure:
            let remoteResult = await proPlayersListRemoteProvider.get()
            switch remoteResult {
            case .success(let players):
                // Make sure to implement ProPlayerDTO.init(player: ProPlayer)
                let dtos = players.map { $0.convertToDTO() }
                proPlayerListLocalService.save(players: dtos)
                return .success(players)
            case .failure(let error):
                return .failure(error)
            }
        }
    }
}
