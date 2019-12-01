package com.example.avtokampi_android_app.models

import java.time.LocalDateTime


data class Lokacija(
    val id: Int,
    val naziv: String,
    val koordinata_x: String,
    val koordinata_y: String,
    val createdAt: LocalDateTime,
    val updatedAt: LocalDateTime,
    val regija: Regija
)