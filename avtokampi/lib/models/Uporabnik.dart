import 'dart:ui';

import 'package:best_flutter_ui_templates/models/Pravica.dart';

class Uporabnik {
    int id;
    String ime;
    String priimek;
    Image slika;
    String telefon;
    String email;
    String geslo;
    DateTime createdAt;
    DateTime updatedAt;
    int pravica;

    Uporabnik.fromUporabnik(this.id, this.ime, this.priimek, this.slika,
        this.telefon,
        this.email, this.geslo, this.createdAt, this.updatedAt, this.pravica);

    Uporabnik(this.ime, this.priimek, this.email, this.geslo);
}
