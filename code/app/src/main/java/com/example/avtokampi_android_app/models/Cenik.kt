package com.example.avtokampi_android_app.models

data class Cenik(
    val id: Int,
    val naziv: String,
    val cena: Double,
    val createdAt: String,
    val updatedAt: String,
    val avtokamp: Avtokamp
)