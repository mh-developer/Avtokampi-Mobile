class KategorijaStoritve {
    int id;
    String naziv;

    KategorijaStoritve.nov();

    KategorijaStoritve(this.id, this.naziv);

    static KategorijaStoritve fromJson(json) {
        KategorijaStoritve ks = new KategorijaStoritve.nov();
        ks.id = json['kategorijaStoritveId'];
        ks.naziv = json['naziv'];
        return ks;
    }
}
