//
// BenchmarksResponseResultTowerDamageInner.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct BenchmarksResponseResultTowerDamageInner: Codable, JSONEncodable, Hashable {

    /** percentile */
    public var percentile: Double?
    /** value */
    public var value: Int?

    public init(percentile: Double? = nil, value: Int? = nil) {
        self.percentile = percentile
        self.value = value
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case percentile
        case value
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(percentile, forKey: .percentile)
        try container.encodeIfPresent(value, forKey: .value)
    }
}

