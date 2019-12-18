import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/Uporabnik.dart';

class Mnenje {
  int id;
  String mnenje;
  String priimek;
  int ocena;
  DateTime createdAt;
  DateTime updatedAt;
  Uporabnik uporabnik;
  Avtokamp avtokamp;

  Mnenje(this.id, this.mnenje, this.priimek, this.ocena, this.createdAt,
      this.updatedAt, this.uporabnik, this.avtokamp);
}
