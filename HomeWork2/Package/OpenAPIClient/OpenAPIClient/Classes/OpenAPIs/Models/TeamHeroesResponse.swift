//
// TeamHeroesResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct TeamHeroesResponse: Codable, JSONEncodable, Hashable {

    /** The ID value of the hero played */
    public var heroId: Int?
    /** Hero name */
    public var name: String?
    /** Number of games played */
    public var gamesPlayed: Int?
    /** Number of wins */
    public var wins: Int?

    public init(heroId: Int? = nil, name: String? = nil, gamesPlayed: Int? = nil, wins: Int? = nil) {
        self.heroId = heroId
        self.name = name
        self.gamesPlayed = gamesPlayed
        self.wins = wins
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case heroId = "hero_id"
        case name
        case gamesPlayed = "games_played"
        case wins
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(heroId, forKey: .heroId)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(gamesPlayed, forKey: .gamesPlayed)
        try container.encodeIfPresent(wins, forKey: .wins)
    }
}

