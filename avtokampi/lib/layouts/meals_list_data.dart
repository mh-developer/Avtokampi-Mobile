import 'package:avtokampi/globals.dart' as globals;
import 'package:avtokampi/models/Avtokamp.dart';
import 'package:avtokampi/models/Mnenje.dart';

class MealsListData {
    MealsListData({
        this.imagePath = '',
        this.titleTxt = '',
        this.startColor = '',
        this.endColor = '',
        this.meals,
        this.kacl = 0,
    });

    String imagePath;
    String titleTxt;
    String startColor;
    String endColor;
    String meals;
    int kacl;

    static Avtokamp getKampById(int kampId) {
        for (Avtokamp avtokamp in globals.avtokampi) {
            if (avtokamp.id == kampId) {
                return avtokamp;
            }
        }
    }

    static getMnenjaForUporabnik() {
        List<MealsListData> mnenja = [];
        for (Mnenje m in globals.mnenja) {
            if (m.uporabnik == globals.currentUser.id) {
                mnenja.add(MealsListData(
                    imagePath: 'assets/images/mnenje_list_ikona.png',
                    titleTxt: getKampById(m.avtokamp).naziv,
                    kacl: m.ocena,
                    meals: m.mnenje,
                    startColor: '#6F72CA',
                    endColor: '#1E1466',));
            }
        }
        return mnenja;
    }

    static List<MealsListData> tabIconsList = <MealsListData>[
        MealsListData(
            imagePath: 'assets/fitness_app/breakfast.png',
            titleTxt: 'Breakfast',
            kacl: 525,
            meals: 'Bread',
            startColor: '#FA7D82',
            endColor: '#FFB295',
        ),
        MealsListData(
            imagePath: 'assets/fitness_app/lunch.png',
            titleTxt: 'Lunch',
            kacl: 602,
            meals: 'Salmon,',
            startColor: '#738AE6',
            endColor: '#5C5EDD',
        ),
        MealsListData(
            imagePath: 'assets/fitness_app/snack.png',
            titleTxt: 'Snack',
            kacl: 0,
            meals: 'Recommend:',
            startColor: '#FE95B6',
            endColor: '#FF5287',
        ),
        MealsListData(
            imagePath: 'assets/fitness_app/dinner.png',
            titleTxt: 'Dinner',
            kacl: 0,
            meals: 'Recommend:',
            startColor: '#6F72CA',
            endColor: '#1E1466',
        ),
    ];
}
