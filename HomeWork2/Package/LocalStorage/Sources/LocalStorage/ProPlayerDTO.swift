//
//  ProPlayerDTO.swift
//  LocalStorage
//
//  Created by Nikolay on 13.05.2025.
//

import Foundation

public struct ProPlayerDTO {
    public struct TeamDTO {
        public let id: Int
        public let name: String
        public let tag: String
        
        public init(
            id: Int,
            name: String,
            tag: String
        ) {
            self.id = id
            self.name = name
            self.tag = tag
        }
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
    
    public init(
        accountId: Int,
        steamid: String,
        avatar: URL?,
        avatarmedium: URL?,
        avatarfull: URL?,
        steamProfile: URL?,
        steamName: String?,
        name: String,
        fantasyRole: Int?,
        team: TeamDTO?
    ) {
        self.accountId = accountId
        self.steamid = steamid
        self.avatar = avatar
        self.avatarmedium = avatarmedium
        self.avatarfull = avatarfull
        self.steamProfile = steamProfile
        self.steamName = steamName
        self.name = name
        self.fantasyRole = fantasyRole
        self.team = team
    }
}

extension ProPlayerDTO: Codable {
}

extension ProPlayerDTO.TeamDTO: Codable {
}

//public extension ProPlayerDTO {
//    init(
//        accountId: Int,
//        steamid: String,
//        avatar: URL?,
//        avatarmedium: URL?,
//        avatarfull: URL?,
//        steamProfile: URL?,
//        steamName: String?,
//        name: String,
//        fantasyRole: Int?,
//        team: TeamDTO?
//    ) {
//        self.accountId = accountId
//        self.steamid = steamid
//        self.avatar = avatar
//        self.avatarmedium = avatarmedium
//        self.avatarfull = avatarfull
//        self.steamProfile = steamProfile
//        self.steamName = steamName
//        self.name = name
//        self.fantasyRole = fantasyRole
//        self.team = team
//    }
//}
