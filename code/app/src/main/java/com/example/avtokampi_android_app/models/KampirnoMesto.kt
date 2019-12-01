package com.example.avtokampi_android_app.models

data class KampirnoMesto(
    val id: Int,
    val naziv: String,
    val velikost: String,
    val createdAt: String,
    val updatedAt: String,
    val avtokamp: Avtokamp,
    val kategorija: Kategorija
)