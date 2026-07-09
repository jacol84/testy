

plugins {
    id("org.springframework.boot") version "3.3.4"               // Podbite z 3.2.5
    id("io.spring.dependency-management") version "1.1.6"       // Podbite z 1.1.4
    kotlin("jvm") version "1.9.25"                              // Podbite z 1.9.23
    kotlin("plugin.spring") version "1.9.25"                    // Podbite z 1.9.23
    application
}

repositories {
    // Use Maven Central for resolving dependencies.
    mavenCentral()
}

dependencies {
    implementation("org.springframework.boot:spring-boot-starter-web")

    // OTO KLUCZOWA ZALEŻNOŚĆ, KTÓRA URUCHOMI BAZĘ W PAMIĘCI:
    implementation("org.springframework.boot:spring-boot-starter-data-jpa")

    implementation("com.fasterxml.jackson.module:jackson-module-kotlin")
    implementation("org.jetbrains.kotlin:kotlin-reflect")
    runtimeOnly("com.h2database:h2")
}

// Apply a specific Java toolchain to ease working on different environments.
java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(21)
    }
}

application {
    // Define the main class for the application.
    mainClass = "org.example.Application"
}

tasks.named<Test>("test") {
    // Use JUnit Platform for unit tests.
    useJUnitPlatform()
}
