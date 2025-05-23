//
// RecordsResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct RecordsResponse: Codable, JSONEncodable, Hashable {

    /** The ID number of the match assigned by Valve */
    public var matchId: Int?
    /** The Unix timestamp at which the game started */
    public var startTime: Int?
    /** The ID value of the hero played */
    public var heroId: Int?
    /** Record score */
    public var score: Int?

    public init(matchId: Int? = nil, startTime: Int? = nil, heroId: Int? = nil, score: Int? = nil) {
        self.matchId = matchId
        self.startTime = startTime
        self.heroId = heroId
        self.score = score
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case matchId = "match_id"
        case startTime = "start_time"
        case heroId = "hero_id"
        case score
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(matchId, forKey: .matchId)
        try container.encodeIfPresent(startTime, forKey: .startTime)
        try container.encodeIfPresent(heroId, forKey: .heroId)
        try container.encodeIfPresent(score, forKey: .score)
    }
}

