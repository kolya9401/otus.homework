//
//  ProPlayerListNetworkService.swift
//  ProPlayersFavorites
//
//  Created by Nikolay on 13.05.2025.
//

import OpenAPIClient

public typealias ProPlayerNTO = PlayerObjectResponse

public protocol ProPlayerListNetworkService: Sendable {
    func get() async -> Result<[ProPlayerNTO], Error>
}

final class ProPlayerListNetworkServiceImpl {
}

// MARK: - ProPlayersListRemoteProvider
extension ProPlayerListNetworkServiceImpl: ProPlayerListNetworkService {
    func get() async -> Result<[ProPlayerNTO], Error> {
        do {
            let result = try await ProPlayersAPI.getProPlayers()
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
