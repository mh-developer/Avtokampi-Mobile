class Storitev {
    int id;
    String naziv;
    int kategorijaStoritve;
    int cenik;

    Storitev.nov();

    Storitev(this.id, this.naziv, this.kategorijaStoritve, this.cenik);

    static Storitev fromJson(json) {
        Storitev s = new Storitev.nov();
        s.id = json['storitevId'];
        s.naziv = json['naziv'];
        s.kategorijaStoritve = json['kategorijaStoritve'];
        s.cenik = json['cenik'];
        return s;
    }
}
