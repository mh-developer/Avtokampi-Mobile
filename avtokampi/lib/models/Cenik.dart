import 'Avtokamp.dart';

class Cenik {
  int id;
  String naziv;
  double cena;
  DateTime createdAt;
  DateTime updatedAt;
  Avtokamp avtokamp;

  Cenik(this.id, this.naziv, this.cena, this.createdAt, this.updatedAt,
      this.avtokamp);
}
