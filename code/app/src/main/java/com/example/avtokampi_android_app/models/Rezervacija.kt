package com.example.avtokampi_android_app.models

import java.time.LocalDateTime

data class Rezervacija(
    val id: Int,
    val datumOd: LocalDateTime,
    val datumDo: LocalDateTime,
    val createdAt: String,
    val updatedAt: String,
    val uporabnik: Uporabnik,
    val avtokamp: Avtokamp,
    val kampirnoMesto: KampirnoMesto,
    val vrstaKampiranja: VrstaKampiranja,
    val statusRezervacije: StatusRezervacije
)