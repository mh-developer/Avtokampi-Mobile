import 'package:best_flutter_ui_templates/layouts/category_list_view.dart';
import 'package:best_flutter_ui_templates/layouts/course_info_screen.dart';
import 'package:best_flutter_ui_templates/layouts/popular_course_list_view.dart';
import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/layouts/hotel_list_data.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:flutter/material.dart';

import '../layouts/design_course_app_theme.dart';

class DesignCourseHomeScreen extends StatefulWidget {
    final Avtokamp avtokamp;
    final HotelListData hotelListData;
    final int kategorija = 1;

    const DesignCourseHomeScreen({Key key, this.avtokamp, this.hotelListData})
        : super(key: key);

    @override
    _DesignCourseHomeScreenState createState() =>
        _DesignCourseHomeScreenState(
            CategoryType.osnovna, avtokamp, hotelListData, kategorija);
}

class _DesignCourseHomeScreenState extends State<DesignCourseHomeScreen> {
    CategoryType categoryType;
    int category;
    Avtokamp kamp;
    HotelListData hotelListData;


    _DesignCourseHomeScreenState(this.categoryType, this.kamp,
        this.hotelListData, this.category);

    @override
    Widget build(BuildContext context) {
        return Container(
            color: DesignCourseAppTheme.nearlyWhite,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                    children: <Widget>[
                        SizedBox(
                            height: MediaQuery
                                .of(context)
                                .padding
                                .top,
                        ),
                        getAppBarUI(),
                        Expanded(
                            child: SingleChildScrollView(
                                child: Container(
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .height,
                                    child: Column(
                                        children: <Widget>[
                                            getSearchBarUI(),
                                            getCategoryUI(),
                                            Flexible(
                                                child: getPopularCourseUI(),
                                            ),
                                        ],
                                    ),
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }

    Widget getCategoryUI() {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 18, right: 16),
                    child: Text(
                        'Kategorija kampirnega mesta',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            letterSpacing: 0.27,
                            color: DesignCourseAppTheme.darkerText,
                        ),
                    ),
                ),
                const SizedBox(
                    height: 16,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                        children: <Widget>[
                            getButtonUI(CategoryType.osnovna,
                                categoryType == CategoryType.osnovna, 1),
                            const SizedBox(
                                width: 16,
                            ),
                            getButtonUI(
                                CategoryType.premium,
                                categoryType == CategoryType.premium, 2),
                            const SizedBox(
                                width: 16,
                            ),
                            getButtonUI(
                                CategoryType.luxury,
                                categoryType == CategoryType.luxury, 3),
                        ],
                    ),
                ),
                const SizedBox(
                    height: 16,
                ),
                new CategoryListView(
                    callBack: () {
                        moveTo();
                    },
                    avtokamp: kamp,
                    hotelListData: hotelListData,
                    kategorija: category,
                ),
            ],
        );
    }

    Widget getPopularCourseUI() {
        return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Text(
                        'Popularni avtokampi',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            letterSpacing: 0.27,
                            color: DesignCourseAppTheme.darkerText,
                        ),
                    ),
                    Flexible(
                        child: PopularCourseListView(
                            callBack: () {
                                moveTo();
                            },
                            avtokamp: kamp,
                            hotelListData: hotelListData,
                        ),
                    )
                ],
            ),
        );
    }

    void moveTo() {
        Navigator.push<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
                builder: (BuildContext context) => CourseInfoScreen(),
            ),
        );
    }

    Widget getButtonUI(CategoryType categoryTypeData, bool isSelected, int kategorija) {
        String txt = '';
        if (CategoryType.osnovna == categoryTypeData) {
            txt = globals.kategorije[0].naziv;
        } else if (CategoryType.premium == categoryTypeData) {
            txt = globals.kategorije[1].naziv;
        } else if (CategoryType.luxury == categoryTypeData) {
            txt = globals.kategorije[2].naziv;
        }
        return Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: isSelected
                        ? DesignCourseAppTheme.nearlyBlue
                        : DesignCourseAppTheme.nearlyWhite,
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    border: Border.all(color: DesignCourseAppTheme.nearlyBlue)),
                child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                        splashColor: Colors.white24,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(24.0)),
                        onTap: () {
                            setState(() {
                                categoryType = categoryTypeData;
                                category = kategorija;
                                globals.kategorija = category;
                            });
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 12, left: 18, right: 18),
                            child: Center(
                                child: Text(
                                    txt,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        letterSpacing: 0.27,
                                        color: isSelected
                                            ? DesignCourseAppTheme.nearlyWhite
                                            : DesignCourseAppTheme.nearlyBlue,
                                    ),
                                ),
                            ),
                        ),
                    ),
                ),
            ),
        );
    }

    Widget getSearchBarUI() {
        return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 18),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.75,
                        height: 64,
                        child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: HexColor('#F8FAFB'),
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(13.0),
                                        bottomLeft: Radius.circular(13.0),
                                        topLeft: Radius.circular(13.0),
                                        topRight: Radius.circular(13.0),
                                    ),
                                ),
                                child: Row(
                                    children: <Widget>[
                                        Expanded(
                                            child: Container(
                                                padding: const EdgeInsets.only(
                                                    left: 16, right: 16),
                                                child: TextFormField(
                                                    style: TextStyle(
                                                        fontFamily: 'WorkSans',
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 16,
                                                        color: DesignCourseAppTheme
                                                            .nearlyBlue,
                                                    ),
                                                    keyboardType: TextInputType
                                                        .text,
                                                    decoration: InputDecoration(
                                                        labelText: 'Poišči kampirno mesto',
                                                        border: InputBorder
                                                            .none,
                                                        helperStyle: TextStyle(
                                                            fontWeight: FontWeight
                                                                .bold,
                                                            fontSize: 16,
                                                            color: HexColor(
                                                                '#B9BABC'),
                                                        ),
                                                        labelStyle: TextStyle(
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            fontSize: 16,
                                                            letterSpacing: 0.2,
                                                            color: HexColor(
                                                                '#B9BABC'),
                                                        ),
                                                    ),
                                                    onEditingComplete: () {},
                                                ),
                                            ),
                                        ),
                                        SizedBox(
                                            width: 60,
                                            height: 60,
                                            child: Icon(Icons.search,
                                                color: HexColor('#B9BABC')),
                                        )
                                    ],
                                ),
                            ),
                        ),
                    ),
                    const Expanded(
                        child: SizedBox(),
                    )
                ],
            ),
        );
    }

    Widget getAppBarUI() {
        return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
            child: Row(
                children: <Widget>[
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                                Text(
                                    'Izberi svoje',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        letterSpacing: 0.2,
                                        color: DesignCourseAppTheme.grey,
                                    ),
                                ),
                                Text(
                                    'Kampirno mesto',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        letterSpacing: 0.27,
                                        color: DesignCourseAppTheme.darkerText,
                                    ),
                                ),
                            ],
                        ),
                    ),
                    Container(
                        width: 60,
                        height: 60,
                        child: Image.asset(
                            'assets/images/ikona.png'),
                    )
                ],
            ),
        );
    }
}

enum CategoryType {
    osnovna,
    premium,
    luxury,
}
