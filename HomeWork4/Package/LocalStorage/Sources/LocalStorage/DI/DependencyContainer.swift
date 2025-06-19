//
//  DependencyContainer.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import RealmSwift
import Foundation

typealias RealmProvider = () -> Realm?

private extension URL {
    static let realmPath: URL = {
        return FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appendingPathComponent("proPlayersList.realm")
    }()
}

private extension Realm.Configuration {
    static var proPlayersListConfiguration: Realm.Configuration {
        .init(
            fileURL: .realmPath,
            schemaVersion: 0,
            migrationBlock: nil,
            deleteRealmIfMigrationNeeded: true,
            objectTypes: [
                CachedProPlayersRealm.self,
                ProPlayerRealm.self,
                TeamRealm.self,
            ],
        )
    }
}

public final class LocalStorageDependencyContainer: @unchecked Sendable {
    private let keyValueStorage: UserKeyValueStorage
    private let realmProvider: RealmProvider
    
    private init() {
        self.keyValueStorage = .init(userDefaults: .standard)
        
        self.realmProvider = {
            return try? Realm(configuration: .proPlayersListConfiguration)
        }
    }
}

public extension LocalStorageDependencyContainer {
    static let shared = LocalStorageDependencyContainer()
}

public extension LocalStorageDependencyContainer {
    func makeFavoritesProPlayerLocalService() -> FavoritesProPlayerLocalService {
        FavoritesProPlayerLocalServiceImpl(keyValueStorage: keyValueStorage)
    }
    
    func makeOnboardingStatusProvider() -> OnboardingStatusProvider {
        OnboardingStatusProviderImpl(userKeyValueStorage: keyValueStorage)
    }
}

public extension LocalStorageDependencyContainer {
    func makeProPlayerListLocalService() -> ProPlayerListLocalService {
        ProPlayerListLocalServiceImpl(realmProvader: realmProvider)
    }
}
