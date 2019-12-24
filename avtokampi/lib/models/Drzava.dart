class Drzava {
    int id;
    String naziv;

    Drzava.nov();

    Drzava(this.id, this.naziv);

    static Drzava fromJson(json) {
        Drzava d = new Drzava.nov();
        d.id = json['drzavaId'];
        d.naziv = json['naziv'];
        return d;
    }
}
