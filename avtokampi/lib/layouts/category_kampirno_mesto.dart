import 'dart:convert';
import 'dart:typed_data';

import 'package:avtokampi/globals.dart' as globals;
import 'package:avtokampi/layouts/hotel_list_data.dart';
import 'package:avtokampi/models/Avtokamp.dart';
import 'package:avtokampi/models/Cenik.dart';
import 'package:avtokampi/models/Drzava.dart';
import 'package:avtokampi/models/KampirnoMesto.dart';
import 'package:avtokampi/models/Mnenje.dart';
import 'package:avtokampi/models/Regija.dart';
import 'package:avtokampi/models/Slika.dart';

class Category {
    Category({
        this.id = 0,
        this.title = '',
        this.imagePath = '',
        this.lessonCount = '',
        this.money = 0,
        this.rating = 0.0,
        this.kampirnoMesto,
        this.hotelListData,
        this.avtokamp,
        this.blobSlika
    });

    static Uint8List getSlikaZaKamp(int kampId) {
        for (Slika slika in globals.slike) {
            if (slika.avtokamp == kampId) {
                return base64Decode(slika.slika);
            }
        }
        return base64Decode(globals.slike[0].slika);
    }

    static List<Cenik> getCenikiZaKamp(int kampId) {
        List<Cenik> cenikiList = [];
        for (Cenik c in globals.ceniki) {
            if (c.avtokamp == kampId) {
                cenikiList.add(c);
            }
        }
        return cenikiList;
    }

    static List getStMnenjZaKamp(int kampId) {
        List<Mnenje> mnenja = [];
        int stMnenj = 0;
        double povprecnaOcena = 0;
        for (Mnenje m in globals.mnenja) {
            if (m.avtokamp == kampId) {
                stMnenj++;
                mnenja.add(m);
                povprecnaOcena += m.ocena;
            }
        }
        return [stMnenj, povprecnaOcena / stMnenj, mnenja];
    }

    static String getDrzavaZaKamp(int regijaId) {
        for (Regija r in globals.regije) {
            if (r.id == regijaId) {
                for (Drzava d in globals.drzave) {
                    if (d.id == r.drzava) {
                        return d.naziv;
                    }
                }
            }
        }
        return "Hrvatska";
    }

    static List<Category> getKampirnaMestaForKamp(Avtokamp avtokamp,
        HotelListData hotelListData, int kategorija) {
        List<Category> kampirnaMestaList = new List<Category>();
        if (globals.kampirnaMesta.isNotEmpty) {
            for (KampirnoMesto kampirnoMesto in globals.kampirnaMesta) {
                if (kampirnoMesto.avtokamp == avtokamp.id &&
                    kampirnoMesto.kategorija == kategorija) {
                    int cena = hotelListData.perNight;
                    if (kategorija == 2) {
                        cena += 20;
                    }
                    if (kategorija == 3) {
                        cena += 40;
                    }
                    kampirnaMestaList.add(Category(
                        id: kampirnoMesto.id,
                        imagePath: 'assets/images/ikona2.png',
                        title: kampirnoMesto.naziv,
                        lessonCount: kampirnoMesto.velikost,
                        money: cena,
                        rating: hotelListData.rating,
                        kampirnoMesto: kampirnoMesto,
                        hotelListData: hotelListData,
                        avtokamp: avtokamp
                    ),);
                }
            }
            return kampirnaMestaList;
        } else {
            return categoryList;
        }
    }

    static List<Category> getPopularniKampi(Avtokamp avtokamp,
        HotelListData hotelListData) {
        List<Category> ostaliKampi = new List<Category>();
        if (globals.avtokampi.isNotEmpty) {
            for (Avtokamp a in globals.avtokampi) {
                if (a.id != avtokamp.id) {
                    List<Cenik> cenikiZaKamp = getCenikiZaKamp(a.id);
                    int cena = 50;
                    if (cenikiZaKamp.length != 0) {
                        cena = cenikiZaKamp[0].cena.toInt();
                    }
                    List l = getStMnenjZaKamp(a.id);
                    int stMnenj = l[0];
                    double povprOcena = l[1];
                    List<Mnenje> mnenja = l[2];
                    Uint8List imageKampPath = getSlikaZaKamp(a.id);
                    ostaliKampi.add(Category(
                        blobSlika: imageKampPath,
                        title: a.naziv,
                        lessonCount: a.nazivLokacije,
                        money: hotelListData.perNight,
                        rating: hotelListData.rating,
                        avtokamp: a,
                        hotelListData: HotelListData(
                            imagePath: imageKampPath,
                            titleTxt: a.naziv,
                            subTxt: a.nazivLokacije,
                            dist: getDrzavaZaKamp(a.regija),
                            reviews: stMnenj,
                            rating: povprOcena,
                            perNight: cena,
                            avtokamp: a,
                            mnenja: mnenja)
                    ),);
                }
            }
            return ostaliKampi;
        } else {
            return popularCourseList;
        }
    }

    String title;
    String lessonCount;
    int money;
    int id;
    double rating;
    String imagePath;
    KampirnoMesto kampirnoMesto;
    HotelListData hotelListData;
    Avtokamp avtokamp;
    Uint8List blobSlika;

    static List<Category> categoryList = <Category>[
        Category(
            imagePath: 'assets/design_course/interFace1.png',
            title: 'User interface Design',
            lessonCount: "24",
            money: 25,
            rating: 4.3,
        ),
        Category(
            imagePath: 'assets/design_course/interFace2.png',
            title: 'User interface Design',
            lessonCount: "22",
            money: 18,
            rating: 4.6,
        ),
        Category(
            imagePath: 'assets/design_course/interFace1.png',
            title: 'User interface Design',
            lessonCount: "24",
            money: 25,
            rating: 4.3,
        ),
        Category(
            imagePath: 'assets/design_course/interFace2.png',
            title: 'User interface Design',
            lessonCount: "22",
            money: 18,
            rating: 4.6,
        ),
    ];

    static List<Category> popularCourseList = <Category>[
        Category(
            imagePath: 'assets/design_course/interFace3.png',
            title: 'App Design Course',
            lessonCount: "12",
            money: 25,
            rating: 4.8,
        ),
        Category(
            imagePath: 'assets/design_course/interFace4.png',
            title: 'Web Design Course',
            lessonCount: "28",
            money: 208,
            rating: 4.9,
        ),
        Category(
            imagePath: 'assets/design_course/interFace3.png',
            title: 'App Design Course',
            lessonCount: "12",
            money: 25,
            rating: 4.8,
        ),
        Category(
            imagePath: 'assets/design_course/interFace4.png',
            title: 'Web Design Course',
            lessonCount: "28",
            money: 208,
            rating: 4.9,
        ),
    ];
}
