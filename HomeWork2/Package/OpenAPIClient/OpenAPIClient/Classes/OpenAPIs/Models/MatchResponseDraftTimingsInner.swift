//
// MatchResponseDraftTimingsInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** draft_stage */
public struct MatchResponseDraftTimingsInner: Codable, JSONEncodable, Hashable {

    /** order */
    public var order: Int?
    /** pick */
    public var pick: Bool?
    /** active_team */
    public var activeTeam: Int?
    /** The ID value of the hero played */
    public var heroId: Int?
    /** Which slot the player is in. 0-127 are Radiant, 128-255 are Dire */
    public var playerSlot: Int?
    /** extra_time */
    public var extraTime: Int?
    /** total_time_taken */
    public var totalTimeTaken: Int?

    public init(order: Int? = nil, pick: Bool? = nil, activeTeam: Int? = nil, heroId: Int? = nil, playerSlot: Int? = nil, extraTime: Int? = nil, totalTimeTaken: Int? = nil) {
        self.order = order
        self.pick = pick
        self.activeTeam = activeTeam
        self.heroId = heroId
        self.playerSlot = playerSlot
        self.extraTime = extraTime
        self.totalTimeTaken = totalTimeTaken
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case order
        case pick
        case activeTeam = "active_team"
        case heroId = "hero_id"
        case playerSlot = "player_slot"
        case extraTime = "extra_time"
        case totalTimeTaken = "total_time_taken"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(order, forKey: .order)
        try container.encodeIfPresent(pick, forKey: .pick)
        try container.encodeIfPresent(activeTeam, forKey: .activeTeam)
        try container.encodeIfPresent(heroId, forKey: .heroId)
        try container.encodeIfPresent(playerSlot, forKey: .playerSlot)
        try container.encodeIfPresent(extraTime, forKey: .extraTime)
        try container.encodeIfPresent(totalTimeTaken, forKey: .totalTimeTaken)
    }
}

