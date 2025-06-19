//
//  UserKeyValueStorage.swift
//  LocalStorage
//
//  Created by Nikolay on 13.05.2025.
//


import Foundation

final class UserKeyValueStorage {
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
}

extension UserKeyValueStorage {
    func value<Value: Decodable>(forKey key: String) -> Value? {
        guard let storageValue = userDefaults.object(forKey: key) else {
            return nil
        }

        let propertyListData = try? PropertyListSerialization.data(
            fromPropertyList: storageValue,
            format: .binary,
            options: 0
        )

        return propertyListData.flatMap { data in
            try? PropertyListDecoder().decode(Value.self, from: data)
        }
    }

    func setValue<Value: Encodable>(_ value: Value?, forKey key: String) {
        let propertyList = value
            .flatMap { try? PropertyListEncoder().encode([$0]) }
            .flatMap { data in
                try? PropertyListSerialization.propertyList(
                    from: data,
                    options: [],
                    format: nil
                )
        }

        let storageValue = propertyList
            .flatMap { $0 as? [Any] }?
            .first

        userDefaults.set(storageValue, forKey: key)
    }
}
