class VrstaKampiranja {
    int id;
    String naziv;

    VrstaKampiranja.nov();

    VrstaKampiranja(this.id, this.naziv);

    static VrstaKampiranja fromJson(json) {
        VrstaKampiranja vk = new VrstaKampiranja.nov();
        vk.id = json['vrstaKampiranjaId'];
        vk.naziv = json['naziv'];
        return vk;
    }
}
