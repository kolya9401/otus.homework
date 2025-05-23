//
// SchemaAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

open class SchemaAPI {

    /**
     GET /schema
     
     - returns: [SchemaResponse]
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    open class func getSchema() async throws -> [SchemaResponse] {
        return try await getSchemaWithRequestBuilder().execute().body
    }

    /**
     GET /schema
     - GET /schema
     - Get database schema
     - returns: RequestBuilder<[SchemaResponse]> 
     */
    open class func getSchemaWithRequestBuilder() -> RequestBuilder<[SchemaResponse]> {
        let localVariablePath = "/schema"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[SchemaResponse]>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
