class ApiRoutes {
    static const LOGIN = 'https://api.kampiraj.ga/api/Auth/login';
    static const REGISTER = 'https://api.kampiraj.ga/api/Auth/register';

    static const AVTOKAMPI = 'https://api.kampiraj.ga/api/Avtokampi';
    static const AVTOKAMP = 'https://api.kampiraj.ga/api/Avtokampi/%s';
    static const AVTOKAMP_SLIKE = 'https://api.kampiraj.ga/api/Avtokampi/%s/slike';
    static const AVTOKAMP_SLIKA = 'https://api.kampiraj.ga/api/Avtokampi/%s/slika';
    static const SLIKA_UREDI = 'https://api.kampiraj.ga/api/Avtokampi/%s';
    static const SLIKA_BRISI = 'https://api.kampiraj.ga/api/Avtokampi/%s/slika';
    static const REGIJE = 'https://api.kampiraj.ga/api/Avtokampi/regije';
    static const DRZAVE = 'https://api.kampiraj.ga/api/Avtokampi/drzave';
    static const CENIKI_ZA_KAMP = 'https://api.kampiraj.ga/api/Avtokampi/%s/ceniki';
    static const CENIK_PODROBNOSTI = 'https://api.kampiraj.ga/api/Avtokampi/%s/cenik';

    static const KAMPIRNA_MESTA_SEZNAM = 'https://api.kampiraj.ga/api/KampirnaMesta/avtokamp/%s';
    static const KAMPIRNA_MESTA_PODATKI = 'https://api.kampiraj.ga/api/KampirnaMesta/%s';
    static const KAMPIRNA_MESTA_NOVO = 'https://api.kampiraj.ga/api/KampirnaMesta/%s';
    static const KAMPIRNA_MESTA_UREDI_BRISI = 'https://api.kampiraj.ga/api/KampirnaMesta/%s/%s';
    static const KAMPIRNA_MESTA_KATEGORIJE = 'https://api.kampiraj.ga/api/KampirnaMesta/kategorije';

    static const REZERVACIJE = 'https://api.kampiraj.ga/api/Rezervacije/%s';
    static const REZERVACIJE_DODAJ = 'https://api.kampiraj.ga/api/Rezervacije';
    static const REZERVACIJE_VRSTA_KAMPIRANJA = 'https://api.kampiraj.ga/api/Rezervacije/vrsta_kampiranja';
    static const REZERVACIJE_STATUSI = 'https://api.kampiraj.ga/api/Rezervacije/status';

    static const STORITVE_KAMPA = 'https://api.kampiraj.ga/api/StoritveKampa/%s';
    static const STORITVE_KAMPA_KATEGORIJE = 'https://api.kampiraj.ga/api/StoritveKampa/kategorije';

    static const UPORABNIKI = 'https://api.kampiraj.ga/api/Uporabniki/%s';
    static const UPORABNIKI_MNENJA = 'https://api.kampiraj.ga/api/Uporabnike/%s/mnenja';
    static const UPORABNIKI_MNENJE = 'https://api.kampiraj.ga/api/Uporabnike/%s/mnenje';
}
