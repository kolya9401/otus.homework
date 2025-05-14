//
//  OnboardingView.swift
//  Onboarding
//
//  Created by Nikolay on 14.05.2025.
//

import SwiftUI

struct OnboardingView: View {
    private let onTapToStartApp: () -> Void
    
    init(onTapToStartApp: @escaping () -> Void) {
        self.onTapToStartApp = onTapToStartApp
    }
    
    var body: some View {
        Text("Данное приложение предоставляет возможность посмотреть список про-игроков в Dota 2")
        Spacer()
        Button(
            action: { onTapToStartApp() },
            label: { Text("Запустить приложение") }
        )
    }
}
