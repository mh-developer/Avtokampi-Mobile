package com.example.avtokampi_android_app.models

data class Avtokamp(
    val id: Int,
    val naziv: String,
    val opis: String,
    val naslov: String,
    val telefon: String,
    val lokacija: Lokacija
)