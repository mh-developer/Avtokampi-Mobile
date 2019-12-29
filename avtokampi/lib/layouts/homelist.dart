import 'package:best_flutter_ui_templates/layouts/avtokampi_map.dart';
import 'package:best_flutter_ui_templates/layouts/dodaj_kamp_forma.dart';
import 'package:best_flutter_ui_templates/layouts/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/layouts/hotel_home_screen.dart';
import 'package:best_flutter_ui_templates/layouts/kampi_mnenja_list.dart';
import 'package:best_flutter_ui_templates/layouts/kampi_web_view.dart';
import 'package:best_flutter_ui_templates/layouts/lastniki_kampov_list.dart';
import 'package:best_flutter_ui_templates/layouts/rezervacija_forma.dart';
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
            navigateScreen: ReservationForm(),
        ),
        HomeList(
            imagePath: 'assets/images/mnenja_ikona.png',
            navigateScreen: KampiList(),
        ),
        HomeList(
            imagePath: 'assets/images/mapa_ikona.png',
            navigateScreen: AvtokampiMap(),
        ),
        HomeList(
            imagePath: 'assets/images/user_ikona.png',
            navigateScreen: FitnessAppHomeScreen(),
        ),
        HomeList(
            imagePath: 'assets/images/web.png',
            navigateScreen: KampiWeb(),
        ),
        HomeList(
            imagePath: 'assets/images/dodaj_ikona.png',
            navigateScreen: DodajKampForm(),
        ),
        HomeList(
            imagePath: 'assets/images/modify.png',
            navigateScreen: LastnikiKampovList(),
        ),
    ];
}
