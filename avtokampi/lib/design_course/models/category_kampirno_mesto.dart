import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/hotel_booking/model/hotel_list_data.dart';
import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/KampirnoMesto.dart';
import 'package:best_flutter_ui_templates/models/Mnenje.dart';

class Category {
    Category({
        this.title = '',
        this.imagePath = '',
        this.lessonCount = '',
        this.money = 0,
        this.rating = 0.0,
        this.kampirnoMesto,
        this.hotelListData,
        this.avtokamp
    });

    static List<Category> getKampirnaMestaForKamp(Avtokamp avtokamp, HotelListData hotelListData, int kategorija) {
        List<Category> kampirnaMestaList = new List<Category>();
        if (globals.kampirnaMesta.isNotEmpty) {
            for (KampirnoMesto kampirnoMesto in globals.kampirnaMesta) {
                if (kampirnoMesto.avtokamp == avtokamp.id && kampirnoMesto.kategorija == kategorija) {
                    int cena = hotelListData.perNight;
                    if (kategorija == 2) {
                        cena += 20;
                    }
                    if (kategorija == 3) {
                        cena += 40;
                    }
                    kampirnaMestaList.add(Category(
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

    static List<Category> getPopularniKampi(Avtokamp avtokamp, HotelListData hotelListData) {
        List<Category> ostaliKampi = new List<Category>();
        if (globals.avtokampi.isNotEmpty) {
            for (Avtokamp a in globals.avtokampi) {
                if (a.id != avtokamp.id) {
                    ostaliKampi.add(Category(
                        imagePath: 'assets/design_course/interFace1.png',
                        title: a.naziv,
                        lessonCount: a.nazivLokacije,
                        money: hotelListData.perNight,
                        rating: hotelListData.rating,
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
    double rating;
    String imagePath;
    KampirnoMesto kampirnoMesto;
    HotelListData hotelListData;
    Avtokamp avtokamp;

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
