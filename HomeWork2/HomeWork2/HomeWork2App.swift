//
//  HomeWork2App.swift
//  HomeWork2
//
//  Created by Nikolay Zhaboedov on 14.04.2025.
//

import SwiftUI
import ProPlayersList

private let di = DependencyContainer.make()

@main
struct HomeWork2App: App {
    var body: some Scene {
        WindowGroup {
            di.makeProPlayersListView()
        }
    }
}
