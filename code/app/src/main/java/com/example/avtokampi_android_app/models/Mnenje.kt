package com.example.avtokampi_android_app.models

data class Mnenje(
    val id: Int,
    val mnenje: String,
    val priimek: String,
    val ocena: Int,
    val createdAt: String,
    val updatedAt: String,
    val uporabnik: Uporabnik,
    val avtokamp: Avtokamp
)