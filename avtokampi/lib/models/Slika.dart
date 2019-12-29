class Slika {
    int id;
    String slika;
    String createdAt;
    String updatedAt;
    int avtokamp;

    Slika.nov();

    Slika(this.id, this.slika, this.createdAt, this.updatedAt,
        this.avtokamp);

    static Slika fromJson(json) {
        Slika s = new Slika.nov();
        s.id = json['cenikId'];
        s.slika = json['slika'];
        s.createdAt = json['createdAt'];
        s.updatedAt = json['updatedAt'];
        s.avtokamp = json['avtokamp'];
        return s;
    }
}
