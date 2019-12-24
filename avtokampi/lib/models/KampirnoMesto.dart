import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/Kategorija.dart';

class KampirnoMesto {
    int id;
    String naziv;
    String velikost;
    DateTime createdAt;
    DateTime updatedAt;
    Avtokamp avtokamp;
    Kategorija kategorija;

    KampirnoMesto(this.id, this.naziv, this.velikost, this.createdAt,
        this.updatedAt, this.avtokamp, this.kategorija);
}
