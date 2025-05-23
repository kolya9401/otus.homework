//
// ScenarioLaneRolesResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ScenarioLaneRolesResponse: Codable, JSONEncodable, Hashable {

    /** The ID value of the hero played */
    public var heroId: Int?
    /** The hero's lane role */
    public var laneRole: Int?
    /** Maximum game length in seconds */
    public var time: Int?
    /** The number of games where the hero played in this lane role */
    public var games: String?
    /** The number of games won where the hero played in this lane role */
    public var wins: String?

    public init(heroId: Int? = nil, laneRole: Int? = nil, time: Int? = nil, games: String? = nil, wins: String? = nil) {
        self.heroId = heroId
        self.laneRole = laneRole
        self.time = time
        self.games = games
        self.wins = wins
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case heroId = "hero_id"
        case laneRole = "lane_role"
        case time
        case games
        case wins
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(heroId, forKey: .heroId)
        try container.encodeIfPresent(laneRole, forKey: .laneRole)
        try container.encodeIfPresent(time, forKey: .time)
        try container.encodeIfPresent(games, forKey: .games)
        try container.encodeIfPresent(wins, forKey: .wins)
    }
}

