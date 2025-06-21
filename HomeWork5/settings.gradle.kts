//enableFeaturePreview("TYPESAFE_PROJECT_ACCESSORS")

pluginManagement {
    plugins {
        id("com.android.library") version "8.4.2"
        id("org.jetbrains.kotlin.multiplatform") version "2.1.21"
        id("org.jetbrains.kotlin.plugin.serialization") version "2.1.21"
    }
    repositories {
        maven("https://maven.pkg.jetbrains.space/kotlin/p/kotlin/dev")
        gradlePluginPortal()
        google()
        mavenCentral()
    }
}

dependencyResolutionManagement {
    repositories {
        gradlePluginPortal()
        google()
        mavenCentral()
        maven("https://maven.pkg.jetbrains.space/kotlin/p/kotlin/dev")
    }
}

rootProject.name = "My_Application"
include(":androidApp")
include(":shared")
include(":NetworkLayer")