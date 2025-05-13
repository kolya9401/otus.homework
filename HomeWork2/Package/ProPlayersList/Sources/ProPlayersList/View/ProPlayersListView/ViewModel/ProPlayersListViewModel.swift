//
//  ProPlayersListViewModel.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import Foundation

protocol ProPlayersListViewModel: ObservableObject {
    @MainActor func load()
    var state: ProPlayersListViewModelState { get set }
}

enum ProPlayersListViewModelState {
    case loading
    case loaded([ProPlayerViewModel])
    case error(String)
}
