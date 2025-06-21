package com.lognex.myapplication

import io.ktor.client.HttpClient
import io.ktor.client.engine.darwin.Darwin
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.json.Json
import org.openapitools.client.apis.CharactersApi
import org.openapitools.client.infrastructure.ApiClient

class DependencyContainer {
    fun makeAPI(): CharactersApi {
        return CharactersApi(
            baseUrl = ApiClient.BASE_URL,
            httpClient = HttpClient(Darwin)
        )
    }
}