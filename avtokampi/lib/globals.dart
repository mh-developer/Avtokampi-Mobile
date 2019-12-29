import 'models/Avtokamp.dart';
import 'models/Cenik.dart';
import 'models/Drzava.dart';
import 'models/KampirnoMesto.dart';
import 'models/Kategorija.dart';
import 'models/KategorijaStoritve.dart';
import 'models/Mnenje.dart';
import 'models/Regija.dart';
import 'models/Rezervacija.dart';
import 'models/Slika.dart';
import 'models/StatusRezervacije.dart';
import 'models/Storitev.dart';
import 'models/StoritevKampirnegaMesta.dart';
import 'models/Uporabnik.dart';
import 'models/VrstaKampiranja.dart';

String jwtToken = "";
Uporabnik currentUser = Uporabnik(
    "Anže", "Luzar", "anze.luzar@gmail.com", "lala");
bool dataLoaded = false;

List<Avtokamp> avtokampi = [];
List<Cenik> ceniki = [];
List<Drzava> drzave = [];
List<KampirnoMesto> kampirnaMesta = [];
List<Kategorija> kategorije = [];
List<KategorijaStoritve> kategorijeStoritev = [];
List<Mnenje> mnenja = [];
List<Regija> regije = [];
List<Rezervacija> rezervacije = [];
List<Slika> slike = [];
List<StatusRezervacije> statusiRezervacij = [];
List<Storitev> storitve = [];
List<StoritevKampirnegaMesta> storitveKampirnihMest = [];
List<VrstaKampiranja> vrsteKampiranj = [];

List<String> priljubljeniKampi = [];

int kategorija = 1;
