import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:flutter/widgets.dart';

class HomeList {
    HomeList({
        this.navigateScreen,
        this.imagePath = '',
    });

    Widget navigateScreen;
    String imagePath;

    static List<HomeList> homeList = [
        HomeList(
            imagePath: 'assets/images/kampi_ikona.png',
            navigateScreen: HotelHomeScreen(),
        ),
        HomeList(
            imagePath: 'assets/images/rezerviraj_ikona.png',
            navigateScreen: FitnessAppHomeScreen(),
        ),
        HomeList(
            imagePath: 'assets/images/dodaj_ikona.png',
            navigateScreen: DesignCourseHomeScreen(),
        ),
        HomeList(
            imagePath: 'assets/images/mnenja_ikona.png',
            navigateScreen: FitnessAppHomeScreen(),
        ),
        HomeList(
            imagePath: 'assets/images/mapa_ikona.png',
            navigateScreen: DesignCourseHomeScreen(),
        ),
        HomeList(
            imagePath: 'assets/images/user_ikona.png',
            navigateScreen: DesignCourseHomeScreen(),
        ),
    ];
}
