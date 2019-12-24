import 'dart:convert';

import 'package:best_flutter_ui_templates/controllers/api_controller.dart';
import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:http/http.dart';

class AvtokampiListData {
    AvtokampiListData({
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

    static List<AvtokampiListData> getKampiList() {
        List<AvtokampiListData> avtokampiList = new List<AvtokampiListData>();
        Response response;
        ApiController apiController = new ApiController();
        apiController.getAvtokampi().then((apiResponse) {
            print("lalal");
            response = apiResponse;
            print(response);
        });
        print(response);
//        if (response.statusCode == 200) {
//            Iterable l = json.decode(response.body);
//            List<Avtokamp> avtokampi = l.map((model) =>
//                Avtokamp.fromJson(model)).toList();
//            avtokampi.forEach((kamp) =>
//                avtokampiList.add(AvtokampiListData(
//                    imagePath: 'assets/hotel/hotel_1.png',
//                    titleTxt: kamp.naziv,
//                    subTxt: kamp.nazivLokacije,
//                    dist: 2.0,
//                    reviews: 10,
//                    rating: 4.4,
//                    perNight: 180,)));
//        } else {
//            print("Nekaj je šlo narobe");
//        }
    }

    static List<AvtokampiListData> avtokampiList = <AvtokampiListData>[
        AvtokampiListData(
            imagePath: 'assets/hotel/hotel_1.png',
            titleTxt: 'Grand Royal Hotel',
            subTxt: 'Wembley, London',
            dist: 2.0,
            reviews: 80,
            rating: 4.4,
            perNight: 180,
        ),
        AvtokampiListData(
            imagePath: 'assets/hotel/hotel_2.png',
            titleTxt: 'Queen Hotel',
            subTxt: 'Wembley, London',
            dist: 4.0,
            reviews: 74,
            rating: 4.5,
            perNight: 200,
        ),
        AvtokampiListData(
            imagePath: 'assets/hotel/hotel_3.png',
            titleTxt: 'Grand Royal Hotel',
            subTxt: 'Wembley, London',
            dist: 3.0,
            reviews: 62,
            rating: 4.0,
            perNight: 60,
        ),
        AvtokampiListData(
            imagePath: 'assets/hotel/hotel_4.png',
            titleTxt: 'Queen Hotel',
            subTxt: 'Wembley, London',
            dist: 7.0,
            reviews: 90,
            rating: 4.4,
            perNight: 170,
        ),
        AvtokampiListData(
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
