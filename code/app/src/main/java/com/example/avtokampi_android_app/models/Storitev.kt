package com.example.avtokampi_android_app.models

data class Storitev(
    val id: Int,
    val naziv: String,
    val kategorijaStoritve: KategorijaStoritve,
    val cenik: Cenik
)