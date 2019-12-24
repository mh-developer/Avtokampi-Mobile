import 'dart:html';

class Slika {
    int id;
    Blob slika;
    String createdAt;
    String updatedAt;
    int uporabnik;
    int avtokamp;

    Slika.nov();

    Slika(this.id, this.slika, this.createdAt, this.updatedAt, this.uporabnik,
        this.avtokamp);

    static Slika fromJson(json) {
        Slika s = new Slika.nov();
        s.id = json['cenikId'];
        s.slika = json['slika'];
        s.createdAt = json['createdAt'];
        s.updatedAt = json['updatedAt'];
        s.uporabnik = json['uporabnik'];
        s.avtokamp = json['avtokamp'];
        return s;
    }
}
