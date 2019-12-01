package com.example.avtokampi_android_app.models

import java.sql.Blob

data class Slika(
    val id: Int,
    val slika: Blob,
    val createdAt: String,
    val updatedAt: String,
    val uporabnik: Uporabnik,
    val avtokamp: Avtokamp
)