class KampirnoMesto {
    int id;
    String naziv;
    String velikost;
    String createdAt;
    String updatedAt;
    int avtokamp;
    int kategorija;

    KampirnoMesto.nov();

    KampirnoMesto(this.id, this.naziv, this.velikost, this.createdAt,
        this.updatedAt, this.avtokamp, this.kategorija);

    KampirnoMesto.novo(this.naziv, this.velikost, this.avtokamp,
        this.kategorija);

    static KampirnoMesto fromJson(json) {
        KampirnoMesto km = new KampirnoMesto.nov();
        km.id = json['kampirnoMestoId'];
        km.naziv = json['naziv'];
        km.velikost = json['velikost'];
        km.createdAt = json['createdAt'];
        km.updatedAt = json['updatedAt'];
        km.avtokamp = json['avtokamp'];
        km.kategorija = json['kategorija'];
        return km;
    }
}
