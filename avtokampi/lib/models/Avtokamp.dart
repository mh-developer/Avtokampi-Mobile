class Avtokamp {
    int id;
    String naziv;
    String opis;
    String naslov;
    String telefon;
    String nazivLokacije;
    String koordinataX;
    String koordinataY;
    bool isActive;
    String createdAt;
    String updatedAt;
    int regija;

    Avtokamp.nov();


    Avtokamp(this.id, this.naziv, this.opis, this.naslov, this.telefon,
        this.nazivLokacije, this.koordinataX, this.koordinataY, this.isActive,
        this.createdAt, this.updatedAt, this.regija);

    static Avtokamp fromJson(json) {
        Avtokamp a = new Avtokamp.nov();
        a.id = json['avtokampId'];
        a.naziv = json['naziv'];
        a.opis = json['opis'];
        a.naslov = json['naslov'];
        a.telefon = json['telefon'];
        a.nazivLokacije = json['nazivLokacije'];
        a.koordinataX = json['koordinataX'];
        a.koordinataY = json['isActive'];
        a.createdAt = json['createdAt'];
        a.updatedAt = json['updatedAt'];
        return a;
    }
}