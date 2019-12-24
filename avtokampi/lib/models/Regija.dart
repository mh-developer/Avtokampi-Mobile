

class Regija {
    int id;
    String naziv;
    int drzava;

    Regija.nov();

    Regija(this.id, this.naziv, this.drzava);

    static Regija fromJson(json) {
        Regija r = new Regija.nov();
        r.id = json['regijaId'];
        r.naziv = json['naziv'];
        r.drzava = json['drzava'];
        return r;
    }
}
