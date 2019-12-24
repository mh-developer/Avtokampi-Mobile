class StatusRezervacije {
    int id;
    String naziv;

    StatusRezervacije.nov();

    StatusRezervacije(this.id, this.naziv);

    static StatusRezervacije fromJson(json) {
        StatusRezervacije sr = new StatusRezervacije.nov();
        sr.id = json['statusRezervacijeId'];
        sr.naziv = json['naziv'];
        return sr;
    }
}
