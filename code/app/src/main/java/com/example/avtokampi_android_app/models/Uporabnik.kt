package com.example.avtokampi_android_app.models

import java.sql.Blob
import java.time.LocalDateTime


data class Uporabnik(
    val id: Int,
    val ime: String,
    val priimek: String,
    val slika: Blob,
    val telefon: String,
    val email: String,
    val geslo: String,
    val createdAt: LocalDateTime,
    val updatedAt: LocalDateTime,
    val pravica: Pravica
)