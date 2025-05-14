//
//  OnboardingStatusProvider.swift
//  LocalStorage
//
//  Created by Nikolay on 14.05.2025.
//

public protocol OnboardingStatusProvider {
    func checkIsOnboardingCompleted() -> Bool
    
    func setOnboardingCompleted()
}

final class OnboardingStatusProviderImpl {
    private let userKeyValueStorage: UserKeyValueStorage
    private let key = "onboardingCompleted"
    
    init(userKeyValueStorage: UserKeyValueStorage) {
        self.userKeyValueStorage = userKeyValueStorage
    }
}

extension OnboardingStatusProviderImpl: OnboardingStatusProvider {
    func checkIsOnboardingCompleted() -> Bool {
        userKeyValueStorage.value(forKey: key) ?? false
    }
    
    func setOnboardingCompleted() {
        userKeyValueStorage.setValue(true, forKey: key)
    }
}
