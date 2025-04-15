//
//  ProPlayersListView.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import SwiftUI

public struct ProPlayersListView: View {
    @ObservedObject var viewModel: ProPlayersListViewModel
    
    init(viewModel: ProPlayersListViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                makeLoadingView()
            case let .error(errorMessage):
                makeErrorView(errorMessage: errorMessage)
            case let .loaded(proPlayers):
                makeLoadedView(proPlayers: proPlayers)
            }
        }
        .onAppear {
            viewModel.load()
        }
    }
}

private extension ProPlayersListView {
    func makeLoadingView() -> some View {
        ProgressView()
    }
    
    func makeErrorView(errorMessage: String) -> some View {
        Text(errorMessage)
            .foregroundColor(.red)
    }
    
    func makeLoadedView(proPlayers: [ProPlayerViewModel]) -> some View {
        List(proPlayers) { player in
            ProPlayerView(viewModel: player)
        }
    }
}
