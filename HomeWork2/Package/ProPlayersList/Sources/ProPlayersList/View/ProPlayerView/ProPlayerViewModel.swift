//
//  ProPlayerViewModel.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import Foundation

struct ProPlayerViewModel: Identifiable {
    let id: Int
    let name: String
    let avatar: URL?
    let teamName: String?
}

extension ProPlayerViewModel {
    init(player: ProPlayer) {
        self = .init(
            id: player.accountId,
            name: player.name,
            avatar: player.avatar,
            teamName: player.team?.name
        )
    }
}
