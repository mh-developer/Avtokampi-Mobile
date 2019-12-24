import 'dart:convert';

import 'package:best_flutter_ui_templates/controllers/api_controller.dart';
import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/Cenik.dart';
import 'package:http/http.dart';

class HotelListData {
    HotelListData({
        this.imagePath = '',
        this.titleTxt = '',
        this.subTxt = "",
        this.dist = 1.8,
        this.reviews = 80,
        this.rating = 4.5,
        this.perNight = 180,
    });

    String imagePath;
    String titleTxt;
    String subTxt;
    double dist;
    double rating;
    int reviews;
    int perNight;


    static List<Cenik> getCenikiZaKamp(int kampId) {
        List<Cenik> cenikiList = new List();
        Response response;
        ApiController apiController = new ApiController();
        apiController.getCenikiForKamp(kampId).then((apiResponse) {
            response = apiResponse;
        }).whenComplete(() {
            print(response.statusCode);
            if (response.statusCode == 200) {
                print("ceniki se iščejo");
                Iterable l = json.decode(response.body);
                cenikiList = l.map((model) =>
                    Cenik.fromJson(model)).toList();
            }
            if (cenikiList.length == 0) {
                cenikiList = <Cenik>[new Cenik(0, "Osnovni", 50, 'now', 'now', kampId)];
            }

        });
        return cenikiList;
    }

    static List<HotelListData> getKampiList() {
        List<HotelListData> avtokampiList = new List<HotelListData>();
        Response response;
        ApiController apiController = new ApiController();
        apiController.getAvtokampi().then((apiResponse) {
            response = apiResponse;
            print(response);
            print(response.statusCode);
        }).whenComplete(() {
            if (response.statusCode == 200) {
                Iterable l = json.decode(response.body);
                List<Avtokamp> avtokampi = l.map((model) =>
                    Avtokamp.fromJson(model)).toList();
                for (Avtokamp kamp in avtokampi) {
                    List<Cenik> cenikiZaKamp = getCenikiZaKamp(kamp.id);
                    avtokampiList.add(HotelListData(
                        imagePath: 'assets/hotel/hotel_1.png',
                        titleTxt: kamp.naziv,
                        subTxt: kamp.nazivLokacije,
                        dist: 2.0,
                        reviews: 10,
                        rating: 4.4,
                        perNight: cenikiZaKamp[0].cena.toInt()));
                }

//                avtokampi.forEach((kamp) =>
//                    avtokampiList.add(HotelListData(
//                    imagePath: 'assets/hotel/hotel_1.png',
//                    titleTxt: kamp.naziv,
//                    subTxt: kamp.nazivLokacije,
//                    dist: 2.0,
//                    reviews: 10,
//                    rating: 4.4,
//                    perNight: 10.0)));
            } else {
            avtokampiList = hotelList;
            }
            print(avtokampiList.length);
            print(avtokampiList);
        });
        return avtokampiList;
    }

    static List<HotelListData> hotelList = <HotelListData>[
        HotelListData(
            imagePath: 'assets/hotel/hotel_1.png',
            titleTxt: 'Grand Royal Hotel',
            subTxt: 'Wembley, London',
            dist: 2.0,
            reviews: 80,
            rating: 4.4,
            perNight: 180,
        ),
        HotelListData(
            imagePath: 'assets/hotel/hotel_2.png',
            titleTxt: 'Queen Hotel',
            subTxt: 'Wembley, London',
            dist: 4.0,
            reviews: 74,
            rating: 4.5,
            perNight: 200,
        ),
        HotelListData(
            imagePath: 'assets/hotel/hotel_3.png',
            titleTxt: 'Grand Royal Hotel',
            subTxt: 'Wembley, London',
            dist: 3.0,
            reviews: 62,
            rating: 4.0,
            perNight: 60,
        ),
        HotelListData(
            imagePath: 'assets/hotel/hotel_4.png',
            titleTxt: 'Queen Hotel',
            subTxt: 'Wembley, London',
            dist: 7.0,
            reviews: 90,
            rating: 4.4,
            perNight: 170,
        ),
        HotelListData(
            imagePath: 'assets/hotel/hotel_5.png',
            titleTxt: 'Grand Royal Hotel',
            subTxt: 'Wembley, London',
            dist: 2.0,
            reviews: 240,
            rating: 4.5,
            perNight: 200,
        ),
    ];
}
