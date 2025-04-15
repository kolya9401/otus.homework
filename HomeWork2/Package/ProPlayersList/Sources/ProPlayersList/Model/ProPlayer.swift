//
//  ProPlayer.swift
//  ProPlayersList
//
//  Created by Nikolay Zhaboedov on 15.04.2025.
//

import Foundation

struct ProPlayer {
    struct Team {
        let id: Int
        let name: String
        let tag: String
    }
    
    let accountId: Int
    let steamid: String
    /// Ссылка на аватар
    let avatar: URL?
    /// Ссылка на (medium)аватар
    let avatarmedium: URL?
    /// Ссылка на (full)аватар
    let avatarfull: URL?
    /// Ссылка на Steam профиль
    let steamProfile: URL?
    /// Имя в Steam
    let steamName: String?
    /// Имя в игре
    let name: String
    /// Позиция игрока
    let fantasyRole: Int? // Сделать енам с позициями
    /// Команда
    let team: Team?
}
