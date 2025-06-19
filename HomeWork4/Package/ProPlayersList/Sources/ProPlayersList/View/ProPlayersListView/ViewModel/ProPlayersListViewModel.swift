//
//  ProPlayersListViewModel.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import Foundation

protocol ProPlayersListViewModel: ObservableObject {
    var state: ProPlayersListViewModelState { get set }
    
    @MainActor func load()
    @MainActor func toggleFavorite(player: ProPlayerViewModel)
}

enum ProPlayersListViewModelState {
    case loading
    case loaded([ProPlayerViewModel])
    case error(String)
}
