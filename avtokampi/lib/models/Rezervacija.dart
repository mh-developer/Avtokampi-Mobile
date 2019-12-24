import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/KampirnoMesto.dart';
import 'package:best_flutter_ui_templates/models/StatusRezervacije.dart';
import 'package:best_flutter_ui_templates/models/VrstaKampiranja.dart';

class Rezervacija {
    int id;
    DateTime datumOd;
    DateTime datumDo;
    DateTime createdAt;
    DateTime updatedAt;
    String uporabnik;
    Avtokamp avtokamp;
    KampirnoMesto kampirnoMesto;
    VrstaKampiranja vrstaKampiranja;
    StatusRezervacije statusRezervacije;

    Rezervacija(this.id,
        this.datumOd,
        this.datumDo,
        this.createdAt,
        this.updatedAt,
        this.uporabnik,
        this.avtokamp,
        this.kampirnoMesto,
        this.vrstaKampiranja,
        this.statusRezervacije);
}
