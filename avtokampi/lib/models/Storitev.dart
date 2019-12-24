import 'package:best_flutter_ui_templates/models/Cenik.dart';
import 'package:best_flutter_ui_templates/models/KategorijaStoritve.dart';

class Storitev {
    int id;
    String naziv;
    KategorijaStoritve kategorijaStoritve;
    Cenik cenik;

    Storitev(this.id, this.naziv, this.kategorijaStoritve, this.cenik);
}
