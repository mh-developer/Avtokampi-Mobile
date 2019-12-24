import 'dart:html';

import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/Uporabnik.dart';

class Slika {
    int id;
    Blob slika;
    DateTime createdAt;
    DateTime updatedAt;
    Uporabnik uporabnik;
    Avtokamp avtokamp;

    Slika(this.id, this.slika, this.createdAt, this.updatedAt, this.uporabnik,
        this.avtokamp);
}
