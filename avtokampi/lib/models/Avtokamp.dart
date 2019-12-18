import 'dart:html';

import 'package:best_flutter_ui_templates/models/Regija.dart';

class Avtokamp {
  int id;
  String naziv;
  String opis;
  String naslov;
  String telefon;
  String nazivLokacije;
  bool isActive;
  Location lokacije;
  DateTime createdAt;
  DateTime updatedAt;
  Regija regija;

  Avtokamp(
      this.id,
      this.naziv,
      this.opis,
      this.naslov,
      this.telefon,
      this.nazivLokacije,
      this.isActive,
      this.lokacije,
      this.createdAt,
      this.updatedAt,
      this.regija);
}
