import 'package:best_flutter_ui_templates/design_course/design_course_app_theme.dart';
import 'package:best_flutter_ui_templates/design_course/models/category_kampirno_mesto.dart';
import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/hotel_booking/model/hotel_list_data.dart';
import 'package:best_flutter_ui_templates/layouts/rezervacija_forma.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:best_flutter_ui_templates/models/Avtokamp.dart';
import 'package:best_flutter_ui_templates/models/KampirnoMesto.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatefulWidget {
    CategoryListView(
        {Key key, this.callBack, this.avtokamp, this.hotelListData, this.kategorija})
        : super(key: key);

    final Function callBack;
    final Avtokamp avtokamp;
    final HotelListData hotelListData;
    final int kategorija;

    @override
    _CategoryListViewState createState() =>
        _CategoryListViewState(avtokamp, hotelListData, kategorija);
}

class _CategoryListViewState extends State<CategoryListView>
    with TickerProviderStateMixin {
    AnimationController animationController;
    List<Category> categoryList;
    Avtokamp avtokamp;

    _CategoryListViewState(this.avtokamp, this.hotelListData, this.kategorija);

    HotelListData hotelListData;
    int kategorija;

    @override
    void initState() {
        animationController = AnimationController(
            duration: const Duration(milliseconds: 2000), vsync: this);
        super.initState();
        categoryList = Category.getKampirnaMestaForKamp(
            avtokamp, hotelListData, globals.kategorija);
    }

    Future<bool> getData() async {
        categoryList = Category.getKampirnaMestaForKamp(
            avtokamp, hotelListData, globals.kategorija);
        await Future<dynamic>.delayed(const Duration(milliseconds: 50));
        return true;
    }

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Container(
                height: 134,
                width: double.infinity,
                child: FutureBuilder<bool>(
                    future: getData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<bool> snapshot) {
                        if (!snapshot.hasData) {
                            return const SizedBox();
                        } else {
                            return ListView.builder(
                                padding: const EdgeInsets.only(
                                    top: 0, bottom: 0, right: 16, left: 16),
                                itemCount: categoryList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                    final int count = categoryList
                                        .length > 10
                                        ? 10
                                        : categoryList.length;
                                    final Animation<double> animation =
                                    Tween<double>(begin: 0.0, end: 1.0).animate(
                                        CurvedAnimation(
                                            parent: animationController,
                                            curve: Interval((1 / count) * index,
                                                1.0,
                                                curve: Curves.fastOutSlowIn)));
                                    animationController.forward();

                                    return CategoryView(
                                        category: categoryList[index],
                                        avtokamp: avtokamp,
                                        animation: animation,
                                        animationController: animationController,
                                        callback: () {
                                            widget.callBack();
                                        },
                                    );
                                },
                            );
                        }
                    },
                ),
            ),
        );
    }
}

class CategoryView extends StatelessWidget {
    const CategoryView({Key key,
        this.category,
        this.animationController,
        this.animation,
        this.callback, this.avtokamp})
        : super(key: key);

    final VoidCallback callback;
    final Category category;
    final AnimationController animationController;
    final Animation<dynamic> animation;
    final Avtokamp avtokamp;

    KampirnoMesto getKampirnoMestoById(int id) {
        for (KampirnoMesto kampirnoMesto in globals.kampirnaMesta) {
            if (kampirnoMesto.id == id) {
                return kampirnoMesto;
            }
        }
    }

    @override
    Widget build(BuildContext context) {
        return AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget child) {
                return FadeTransition(
                    opacity: animation,
                    child: Transform(
                        transform: Matrix4.translationValues(
                            100 * (1.0 - animation.value), 0.0, 0.0),
                        child: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                                Navigator.push<dynamic>(context,
                                    MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) =>
                                            ReservationForm.drug(izbraniKamp: avtokamp, izbranoKampirnoMesto: getKampirnoMestoById(category.id), preValued: true,)));
                            },
                            child: SizedBox(
                                width: 280,
                                child: Stack(
                                    children: <Widget>[
                                        Container(
                                            child: Row(
                                                children: <Widget>[
                                                    const SizedBox(
                                                        width: 48,
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                color: HexColor(
                                                                    '#F8FAFB'),
                                                                borderRadius: const BorderRadius
                                                                    .all(
                                                                    Radius
                                                                        .circular(
                                                                        16.0)),
                                                            ),
                                                            child: Row(
                                                                children: <
                                                                    Widget>[
                                                                    const SizedBox(
                                                                        width: 48 +
                                                                            24.0,
                                                                    ),
                                                                    Expanded(
                                                                        child: Container(
                                                                            child: Column(
                                                                                children: <
                                                                                    Widget>[
                                                                                    Padding(
                                                                                        padding:
                                                                                        const EdgeInsets
                                                                                            .only(
                                                                                            top: 16),
                                                                                        child: Text(
                                                                                            category
                                                                                                .title,
                                                                                            textAlign: TextAlign
                                                                                                .left,
                                                                                            style: TextStyle(
                                                                                                fontWeight: FontWeight
                                                                                                    .w600,
                                                                                                fontSize: 16,
                                                                                                letterSpacing: 0.27,
                                                                                                color: DesignCourseAppTheme
                                                                                                    .darkerText,
                                                                                            ),
                                                                                        ),
                                                                                    ),
                                                                                    const Expanded(
                                                                                        child: SizedBox(),
                                                                                    ),
                                                                                    Padding(
                                                                                        padding: const EdgeInsets
                                                                                            .only(
                                                                                            right: 16,
                                                                                            bottom: 8),
                                                                                        child: Row(
                                                                                            mainAxisAlignment:
                                                                                            MainAxisAlignment
                                                                                                .spaceBetween,
                                                                                            crossAxisAlignment:
                                                                                            CrossAxisAlignment
                                                                                                .center,
                                                                                            children: <
                                                                                                Widget>[
                                                                                                Text(
                                                                                                    'velikost: ${category
                                                                                                        .lessonCount}',
                                                                                                    textAlign: TextAlign
                                                                                                        .left,
                                                                                                    style: TextStyle(
                                                                                                        fontWeight: FontWeight
                                                                                                            .w200,
                                                                                                        fontSize: 12,
                                                                                                        letterSpacing: 0.27,
                                                                                                        color: DesignCourseAppTheme
                                                                                                            .grey,
                                                                                                    ),
                                                                                                ),
                                                                                                Container(
                                                                                                    child: Row(
                                                                                                        children: <
                                                                                                            Widget>[
                                                                                                            Text(
                                                                                                                '${category
                                                                                                                    .rating
                                                                                                                    .toInt()
                                                                                                                    .toString()}',
                                                                                                                textAlign:
                                                                                                                TextAlign
                                                                                                                    .left,
                                                                                                                style: TextStyle(
                                                                                                                    fontWeight:
                                                                                                                    FontWeight
                                                                                                                        .w200,
                                                                                                                    fontSize: 18,
                                                                                                                    letterSpacing: 0.27,
                                                                                                                    color:
                                                                                                                    DesignCourseAppTheme
                                                                                                                        .grey,
                                                                                                                ),
                                                                                                            ),
                                                                                                            Icon(
                                                                                                                Icons
                                                                                                                    .star,
                                                                                                                color:
                                                                                                                DesignCourseAppTheme
                                                                                                                    .nearlyBlue,
                                                                                                                size: 20,
                                                                                                            ),
                                                                                                        ],
                                                                                                    ),
                                                                                                )
                                                                                            ],
                                                                                        ),
                                                                                    ),
                                                                                    Padding(
                                                                                        padding: const EdgeInsets
                                                                                            .only(
                                                                                            bottom: 16,
                                                                                            right: 16),
                                                                                        child: Row(
                                                                                            mainAxisAlignment:
                                                                                            MainAxisAlignment
                                                                                                .spaceBetween,
                                                                                            crossAxisAlignment:
                                                                                            CrossAxisAlignment
                                                                                                .start,
                                                                                            children: <
                                                                                                Widget>[
                                                                                                Text(
                                                                                                    '${category
                                                                                                        .money}€/noč',
                                                                                                    textAlign: TextAlign
                                                                                                        .left,
                                                                                                    style: TextStyle(
                                                                                                        fontWeight: FontWeight
                                                                                                            .w600,
                                                                                                        fontSize: 18,
                                                                                                        letterSpacing: 0.27,
                                                                                                        color: DesignCourseAppTheme
                                                                                                            .nearlyBlue,
                                                                                                    ),
                                                                                                ),
                                                                                                Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                        color: DesignCourseAppTheme
                                                                                                            .nearlyBlue,
                                                                                                        borderRadius:
                                                                                                        const BorderRadius
                                                                                                            .all(
                                                                                                            Radius
                                                                                                                .circular(
                                                                                                                8.0)),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                        padding:
                                                                                                        const EdgeInsets
                                                                                                            .all(
                                                                                                            4.0),
                                                                                                        child: Icon(
                                                                                                            Icons
                                                                                                                .add,
                                                                                                            color:
                                                                                                            DesignCourseAppTheme
                                                                                                                .nearlyWhite,
                                                                                                        ),
                                                                                                    ),
                                                                                                )
                                                                                            ],
                                                                                        ),
                                                                                    ),
                                                                                ],
                                                                            ),
                                                                        ),
                                                                    ),
                                                                ],
                                                            ),
                                                        ),
                                                    )
                                                ],
                                            ),
                                        ),
                                        Container(
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 24,
                                                    bottom: 24,
                                                    left: 16),
                                                child: Row(
                                                    children: <Widget>[
                                                        ClipRRect(
                                                            borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    16.0)),
                                                            child: AspectRatio(
                                                                aspectRatio: 1.0,
                                                                child: Image
                                                                    .asset(
                                                                    category
                                                                        .imagePath)),
                                                        )
                                                    ],
                                                ),
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ),
                    ),
                );
            },
        );
    }
}
