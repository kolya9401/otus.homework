//
// TeamPlayersResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TeamPlayersResponse: Codable, JSONEncodable, Hashable {

    /** The player account ID */
    public var accountId: Int?
    /** name */
    public var name: String?
    /** Number of games played */
    public var gamesPlayed: Int?
    /** Number of wins */
    public var wins: Int?
    /** If this player is on the current roster */
    public var isCurrentTeamMember: Bool?

    public init(accountId: Int? = nil, name: String? = nil, gamesPlayed: Int? = nil, wins: Int? = nil, isCurrentTeamMember: Bool? = nil) {
        self.accountId = accountId
        self.name = name
        self.gamesPlayed = gamesPlayed
        self.wins = wins
        self.isCurrentTeamMember = isCurrentTeamMember
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case accountId = "account_id"
        case name
        case gamesPlayed = "games_played"
        case wins
        case isCurrentTeamMember = "is_current_team_member"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(accountId, forKey: .accountId)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(gamesPlayed, forKey: .gamesPlayed)
        try container.encodeIfPresent(wins, forKey: .wins)
        try container.encodeIfPresent(isCurrentTeamMember, forKey: .isCurrentTeamMember)
    }
}

