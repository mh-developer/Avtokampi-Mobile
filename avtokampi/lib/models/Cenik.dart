class Cenik {
    int id;
    String naziv;
    double cena;
    String createdAt;
    String updatedAt;
    int avtokamp;

    Cenik.nov();

    Cenik(this.id, this.naziv, this.cena, this.createdAt, this.updatedAt,
        this.avtokamp);

    static Cenik fromJson(json) {
        Cenik c = new Cenik.nov();
        c.id = json['cenikId'];
        c.naziv = json['naziv'];
        c.cena = json['cena'];
        c.createdAt = json['createdAt'];
        c.updatedAt = json['updatedAt'];
        c.avtokamp = json['avtokamp'];
        return c;
    }
}
