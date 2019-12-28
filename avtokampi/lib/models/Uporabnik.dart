class Uporabnik {
    int id;
    String ime;
    String priimek;
    String slika;
    String telefon;
    String email;
    String geslo;
    String createdAt;
    String updatedAt;
    int pravica;

    Uporabnik.nov();

    Uporabnik.fromUporabnik(this.id, this.ime, this.priimek, this.slika,
        this.telefon,
        this.email, this.geslo, this.createdAt, this.updatedAt, this.pravica);

    Uporabnik(this.ime, this.priimek, this.email, this.geslo);

    static Uporabnik fromJson(json) {
        Uporabnik u = new Uporabnik.nov();
        u.id = json['uporabnikId'];
        u.ime = json['ime'];
        u.priimek = json['priimek'];
        u.slika = json['slika'];
        u.telefon = json['telefon'];
        u.email = json['email'];
        u.geslo = json['geslo'];
        u.createdAt = json['createdAt'];
        u.updatedAt = json['updatedAt'];
        u.pravica = json['pravice'];
        return u;
    }
}
