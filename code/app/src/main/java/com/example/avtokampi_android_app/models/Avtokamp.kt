package com.example.avtokampi_android_app.models

import com.google.android.gms.maps.model.LatLng

data class Avtokamp(
    val id: Int,
    val naziv: String,
    val opis: String,
    val naslov: String,
    val telefon: String,
    val naziv_lokacije: String,
    val isActive: Boolean,
    val lokacija: LatLng,
    val createdAt: String,
    val updatedAt: String,
    val regija: Regija
)