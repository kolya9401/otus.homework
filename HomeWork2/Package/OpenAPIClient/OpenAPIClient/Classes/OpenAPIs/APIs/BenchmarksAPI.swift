//
// BenchmarksAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class BenchmarksAPI {

    /**
     GET /benchmarks
     
     - parameter heroId: (query) Hero ID 
     - returns: BenchmarksResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func getBenchmarks(heroId: String) async throws -> BenchmarksResponse {
        return try await getBenchmarksWithRequestBuilder(heroId: heroId).execute().body
    }

    /**
     GET /benchmarks
     - GET /benchmarks
     - Benchmarks of average stat values for a hero
     - parameter heroId: (query) Hero ID 
     - returns: RequestBuilder<BenchmarksResponse> 
     */
    open class func getBenchmarksWithRequestBuilder(heroId: String) -> RequestBuilder<BenchmarksResponse> {
        let localVariablePath = "/benchmarks"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "hero_id": (wrappedValue: heroId.encodeToJSON(), isExplode: true),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<BenchmarksResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
