import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/Cenik.dart';
import 'package:best_flutter_ui_templates/models/Drzava.dart';
import 'package:best_flutter_ui_templates/models/Mnenje.dart';
import 'package:best_flutter_ui_templates/models/Regija.dart';

class HotelListData {
    HotelListData({
        this.imagePath = '',
        this.titleTxt = '',
        this.subTxt = "",
        this.dist = "",
        this.reviews = 80,
        this.rating = 4.5,
        this.perNight = 180,
        this.avtokamp
    });

    String imagePath;
    String titleTxt;
    String subTxt;
    String dist;
    double rating;
    int reviews;
    int perNight;
    Avtokamp avtokamp;

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
        int stMnenj = 0;
        double povprecnaOcena = 0;
        for (Mnenje m in globals.mnenja) {
            if (m.avtokamp == kampId) {
                stMnenj++;
                povprecnaOcena += m.ocena;
            }
        }
        return [stMnenj, povprecnaOcena / stMnenj];
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

    static List<HotelListData> getKampiList() {
        List<HotelListData> avtokampiList = new List<HotelListData>();
        if (globals.avtokampi.isNotEmpty) {
            for (Avtokamp kamp in globals.avtokampi) {
                List<Cenik> cenikiZaKamp = getCenikiZaKamp(kamp.id);
                int cena = 50;
                if (cenikiZaKamp.length != 0) {
                    cena = cenikiZaKamp[0].cena.toInt();
                }
                List l = getStMnenjZaKamp(kamp.id);
                int stMnenj = l[0];
                double povprOcena = l[1];
                avtokampiList.add(HotelListData(
                    imagePath: 'assets/hotel/hotel_1.png',
                    titleTxt: kamp.naziv,
                    subTxt: kamp.nazivLokacije,
                    dist: getDrzavaZaKamp(kamp.regija),
                    reviews: stMnenj,
                    rating: povprOcena,
                    perNight: cena,
                    avtokamp: kamp));
            }
        } else {
            avtokampiList = hotelList;
        }
        return avtokampiList;
    }

    static List<HotelListData> hotelList = <HotelListData>[
        HotelListData(
            imagePath: 'assets/hotel/hotel_1.png',
            titleTxt: 'Grand Royal Hotel',
            subTxt: 'Wembley, London',
            dist: "Hrvaška",
            reviews: 80,
            rating: 4.4,
            perNight: 180,
        ),
        HotelListData(
            imagePath: 'assets/hotel/hotel_2.png',
            titleTxt: 'Queen Hotel',
            subTxt: 'Wembley, London',
            dist: "Hrvaška",
            reviews: 74,
            rating: 4.5,
            perNight: 200,
        ),
        HotelListData(
            imagePath: 'assets/hotel/hotel_3.png',
            titleTxt: 'Grand Royal Hotel',
            subTxt: 'Wembley, London',
            dist: "Hrvaška",
            reviews: 62,
            rating: 4.0,
            perNight: 60,
        ),
        HotelListData(
            imagePath: 'assets/hotel/hotel_4.png',
            titleTxt: 'Queen Hotel',
            subTxt: 'Wembley, London',
            dist: "Hrvaška",
            reviews: 90,
            rating: 4.4,
            perNight: 170,
        ),
        HotelListData(
            imagePath: 'assets/hotel/hotel_5.png',
            titleTxt: 'Grand Royal Hotel',
            subTxt: 'Wembley, London',
            dist: "Hrvaška",
            reviews: 240,
            rating: 4.5,
            perNight: 200,
        ),
    ];
}
