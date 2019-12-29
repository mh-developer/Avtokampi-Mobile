import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/Mnenje.dart';

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
    List<String> meals;
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
                    meals: <String>[m.mnenje],
                    startColor: '#FE95B6',
                    endColor: '#FF5287',));
            }
        }
        if (mnenja.length == 0) {
            return tabIconsList;
        }
        return mnenja;
    }

    static List<MealsListData> tabIconsList = <MealsListData>[
        MealsListData(
            imagePath: 'assets/fitness_app/breakfast.png',
            titleTxt: 'Breakfast',
            kacl: 525,
            meals: <String>['Bread,', 'Peanut butter,', 'Apple'],
            startColor: '#FA7D82',
            endColor: '#FFB295',
        ),
        MealsListData(
            imagePath: 'assets/fitness_app/lunch.png',
            titleTxt: 'Lunch',
            kacl: 602,
            meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
            startColor: '#738AE6',
            endColor: '#5C5EDD',
        ),
        MealsListData(
            imagePath: 'assets/fitness_app/snack.png',
            titleTxt: 'Snack',
            kacl: 0,
            meals: <String>['Recommend:', '800 kcal'],
            startColor: '#FE95B6',
            endColor: '#FF5287',
        ),
        MealsListData(
            imagePath: 'assets/fitness_app/dinner.png',
            titleTxt: 'Dinner',
            kacl: 0,
            meals: <String>['Recommend:', '703 kcal'],
            startColor: '#6F72CA',
            endColor: '#1E1466',
        ),
    ];
}
