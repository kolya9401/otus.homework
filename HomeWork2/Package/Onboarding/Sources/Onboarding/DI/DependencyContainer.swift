//
//  DependencyContainer.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import SwiftUI

public final class OnboardingDependencyContainer: @unchecked Sendable {
    private init() {
    }

    static let shared: OnboardingDependencyContainer = .init()
}

public extension OnboardingDependencyContainer {
    @MainActor func makeOnboardingView(onTapToStartApp: @escaping () -> Void) -> some View {
        OnboardingView(onTapToStartApp: onTapToStartApp)
    }
}
