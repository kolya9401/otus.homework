/**
 *
 * Please note:
 * This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * Do not edit this file manually.
 *
 */

@file:Suppress(
    "ArrayInDataClass",
    "EnumEntryName",
    "RemoveRedundantQualifierName",
    "UnusedImport"
)

package org.openapitools.client.models


import kotlinx.serialization.*
import kotlinx.serialization.descriptors.*
import kotlinx.serialization.encoding.*

/**
 * 
 *
 * @param count 
 * @param pages 
 * @param next 
 * @param prev 
 */
@Serializable

data class Info (

    @SerialName(value = "count") @Required val count: kotlin.Int,

    @SerialName(value = "pages") @Required val pages: kotlin.Int,

    @SerialName(value = "next") val next: kotlin.String? = null,

    @SerialName(value = "prev") val prev: kotlin.String? = null

) {


}

