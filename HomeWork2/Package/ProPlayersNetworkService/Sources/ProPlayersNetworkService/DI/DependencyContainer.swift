//
//  DependencyContainer.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

public final class NetworkServiceDependencyContainer: @unchecked Sendable {
    private init() {
    }
}

public extension NetworkServiceDependencyContainer {
    static let shared = NetworkServiceDependencyContainer()
}

public extension NetworkServiceDependencyContainer {
    func makeProPlayerListNetworkService() -> ProPlayerListNetworkService {
        ProPlayerListNetworkServiceImpl()
    }
}
