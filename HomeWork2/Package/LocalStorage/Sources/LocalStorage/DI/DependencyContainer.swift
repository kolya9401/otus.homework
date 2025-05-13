//
//  DependencyContainer.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

public final class LocalStorageDependencyContainer: @unchecked Sendable {
    private let keyValueStorage: UserKeyValueStorage
    
    private init() {
        self.keyValueStorage = .init(userDefaults: .standard)
    }
}

public extension LocalStorageDependencyContainer {
    static let shared = LocalStorageDependencyContainer()
}

public extension LocalStorageDependencyContainer {
    func make() -> FavoritesProPlayerLocalService {
        FavoritesProPlayerLocalServiceImpl(keyValueStorage: keyValueStorage)
    }
}
