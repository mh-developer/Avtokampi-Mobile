package com.example.avtokampi_android_app.models

import java.time.LocalDateTime

data class Kategorija(
    val id: Int,
    val naziv: String,
    val createdAt: LocalDateTime,
    val updatedAt: LocalDateTime
)