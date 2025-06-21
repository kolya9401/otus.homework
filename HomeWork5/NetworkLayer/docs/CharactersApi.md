# CharactersApi

All URIs are relative to *https://rickandmortyapi.com/api*

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**getAllCharacters**](CharactersApi.md#getAllCharacters) | **GET** /character | get all characters |
| [**getCharacterById**](CharactersApi.md#getCharacterById) | **GET** /character/{id} | get all characters |


<a id="getAllCharacters"></a>
# **getAllCharacters**
> CharactersList getAllCharacters(page)

get all characters

Get All Characters

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = CharactersApi()
val page : kotlin.Int = 56 // kotlin.Int | 
try {
    val result : CharactersList = apiInstance.getAllCharacters(page)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling CharactersApi#getAllCharacters")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling CharactersApi#getAllCharacters")
    e.printStackTrace()
}
```

### Parameters
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **page** | **kotlin.Int**|  | |

### Return type

[**CharactersList**](CharactersList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

<a id="getCharacterById"></a>
# **getCharacterById**
> Character getCharacterById(id)

get all characters

Get Character By Id

### Example
```kotlin
// Import classes:
//import org.openapitools.client.infrastructure.*
//import org.openapitools.client.models.*

val apiInstance = CharactersApi()
val id : kotlin.Int = 56 // kotlin.Int | 
try {
    val result : Character = apiInstance.getCharacterById(id)
    println(result)
} catch (e: ClientException) {
    println("4xx response calling CharactersApi#getCharacterById")
    e.printStackTrace()
} catch (e: ServerException) {
    println("5xx response calling CharactersApi#getCharacterById")
    e.printStackTrace()
}
```

### Parameters
| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **id** | **kotlin.Int**|  | |

### Return type

[**Character**](Character.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

