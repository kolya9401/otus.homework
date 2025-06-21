package com.lognex.myapplication

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform