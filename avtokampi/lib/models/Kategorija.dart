class Kategorija {
    int id;
    String naziv;
    String createdAt;
    String updatedAt;

    Kategorija.nov();

    Kategorija(this.id, this.naziv, this.createdAt, this.updatedAt);

    static Kategorija fromJson(json) {
        Kategorija k = new Kategorija.nov();
        k.id = json['kategorijaId'];
        k.naziv = json['naziv'];
        k.createdAt = json['createdAt'];
        k.updatedAt = json['updatedAt'];
        return k;
    }
}
