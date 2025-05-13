//
//  ProPlayerDTO.swift
//  LocalStorage
//
//  Created by Nikolay on 13.05.2025.
//

import Foundation

public struct ProPlayerDTO: Codable {
    public struct TeamDTO: Codable {
        let id: Int
        let name: String
        let tag: String
    }
    
    public let accountId: Int
    public let steamid: String
    /// Ссылка на аватар
    public let avatar: URL?
    /// Ссылка на (medium)аватар
    public let avatarmedium: URL?
    /// Ссылка на (full)аватар
    public let avatarfull: URL?
    /// Ссылка на Steam профиль
    public let steamProfile: URL?
    /// Имя в Steam
    public let steamName: String?
    /// Имя в игре
    public let name: String
    /// Позиция игрока
    public let fantasyRole: Int? // Сделать енам с позициями
    /// Команда
    public let team: TeamDTO?
}
