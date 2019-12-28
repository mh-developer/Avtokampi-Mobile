class Mnenje {
    int id;
    String mnenje;
    int ocena;
    String createdAt;
    String updatedAt;
    int uporabnik;
    int avtokamp;

    Mnenje.nov();

    Mnenje(this.id, this.mnenje, this.ocena, this.createdAt,
        this.updatedAt, this.uporabnik, this.avtokamp);

    Mnenje.novo(this.mnenje, this.ocena, this.uporabnik, this.avtokamp);

    static Mnenje fromJson(json) {
        Mnenje m = new Mnenje.nov();
        m.id = json['mnenjeId'];
        m.mnenje = json['mnenje'];
        m.ocena = json['ocena'];
        m.createdAt = json['createdAt'];
        m.updatedAt = json['updatedAt'];
        m.avtokamp = json['uporabnik'];
        m.avtokamp = json['avtokamp'];
        return m;
    }
}
