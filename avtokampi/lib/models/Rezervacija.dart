class Rezervacija {
    int id;
    String datumOd;
    String datumDo;
    String createdAt;
    String updatedAt;
    int uporabnik;
    int avtokamp;
    int kampirnoMesto;
    int vrstaKampiranja;
    int statusRezervacije;

    Rezervacija.nov();

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

    static Rezervacija fromJson(json) {
        Rezervacija r = new Rezervacija.nov();
        r.id = json['cenikId'];
        r.datumOd = json['datumOd'];
        r.datumDo = json['datumDo'];
        r.createdAt = json['createdAt'];
        r.updatedAt = json['updatedAt'];
        r.avtokamp = json['uporabnik'];
        r.avtokamp = json['avtokamp'];
        r.avtokamp = json['kampirnoMesto'];
        r.avtokamp = json['vrstaKampiranja'];
        r.avtokamp = json['statusRezervacije'];
        return r;
    }
}
