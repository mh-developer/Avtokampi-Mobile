class StoritevKampirnegaMesta {
    int id;
    int kampirnoMesto;
    int storitev;

    StoritevKampirnegaMesta.nov();

    StoritevKampirnegaMesta(this.id, this.kampirnoMesto, this.storitev);

    StoritevKampirnegaMesta.nova(this.kampirnoMesto, this.storitev);

    static StoritevKampirnegaMesta fromJson(json) {
        StoritevKampirnegaMesta skm = new StoritevKampirnegaMesta.nov();
        skm.id = json['storitevKampirnegaMestaId'];
        skm.kampirnoMesto = json['kampirnoMesto'];
        skm.storitev = json['storitev'];
        return skm;
    }
}
