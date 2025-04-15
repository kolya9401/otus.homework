//
//  ContentView.swift
//  HomeWork2
//
//  Created by Nikolay Zhaboedov on 14.04.2025.
//

import SwiftUI
import OpenAPIClient

struct ContentView: View {
    @State var proPlayers: [PlayerObjectResponse] = []
    
    var body: some View {
        VStack {
            List(proPlayers) { player in
                Text(player.name ?? "No name")
            }
        }
        .onAppear {
            load()
        }
        .padding()
    }
    
    private func load() {
        Task {
            do {
                let result = try await ProPlayersAPI.getProPlayers()
                self.proPlayers = result
            }
        }
    }
}

#Preview {
    ContentView()
}

extension PlayerObjectResponse: Identifiable {
    public var id: String {
        return self.accountId?.description ?? UUID().uuidString
    }
}
