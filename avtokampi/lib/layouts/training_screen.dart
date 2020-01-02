import 'package:avtokampi/globals.dart' as globals;
import 'package:avtokampi/layouts/running_view.dart';
import 'package:avtokampi/layouts/title_view.dart';
import 'package:avtokampi/layouts/workout_view.dart';
import 'package:avtokampi/models/Avtokamp.dart';
import 'package:avtokampi/models/KampirnoMesto.dart';
import 'package:avtokampi/models/Rezervacija.dart';
import 'package:avtokampi/models/StoritevKampirnegaMesta.dart';
import 'package:flutter/material.dart';

import '../layouts/fintness_app_theme.dart';

class TrainingScreen extends StatefulWidget {
    const TrainingScreen({Key key, this.animationController}) : super(key: key);

    final AnimationController animationController;

    @override
    _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen>
    with TickerProviderStateMixin {
    Animation<double> topBarAnimation;

    List<Widget> listViews = <Widget>[];
    final ScrollController scrollController = ScrollController();
    double topBarOpacity = 0.0;

    //List<StoritevKampirnegaMesta> storitveKampirnihMest = [];

    @override
    void initState() {
        //storitveKampirnihMest = getStoritveZaUporabnika();
        topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
        addAllListData();

        scrollController.addListener(() {
            if (scrollController.offset >= 24) {
                if (topBarOpacity != 1.0) {
                    setState(() {
                        topBarOpacity = 1.0;
                    });
                }
            } else if (scrollController.offset <= 24 &&
                scrollController.offset >= 0) {
                if (topBarOpacity != scrollController.offset / 24) {
                    setState(() {
                        topBarOpacity = scrollController.offset / 24;
                    });
                }
            } else if (scrollController.offset <= 0) {
                if (topBarOpacity != 0.0) {
                    setState(() {
                        topBarOpacity = 0.0;
                    });
                }
            }
        });
        super.initState();
    }

    void addAllListData() {
        const int count = 5;

        listViews.add(
            TitleView(
                titleTxt: 'Vaše rezervacije',
                subTxt: 'Več',
                animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: widget.animationController,
                        curve:
                        Interval((1 / count) * 0, 1.0,
                            curve: Curves.fastOutSlowIn))),
                animationController: widget.animationController,
            ),
        );
        listViews.add(
            WorkoutView(
                animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: widget.animationController,
                        curve:
                        Interval((1 / count) * 2, 1.0,
                            curve: Curves.fastOutSlowIn))),
                animationController: widget.animationController,
            ),
        );
        listViews.add(
            TitleView(
                titleTxt: 'Prijave na storitve',
                subTxt: 'Več',
                animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: widget.animationController,
                        curve:
                        Interval((1 / count) * 0, 1.0,
                            curve: Curves.fastOutSlowIn))),
                animationController: widget.animationController,
            ),
        );
        listViews.add(
            RunningView(
                animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: widget.animationController,
                        curve:
                        Interval((1 / count) * 3, 1.0,
                            curve: Curves.fastOutSlowIn))),
                animationController: widget.animationController,
            ),
        );
//        listViews.add(ListView.builder(
//            padding: const EdgeInsets.all(4),
//            itemCount: storitveKampirnihMest.length,
//            itemBuilder: (BuildContext context, int index) {
//                return Container(
//                    height: 50,
//                    color: Colors.deepOrange,
//                    child: Center(child: Text('Avtokamp: ${getKampById(
//                        getKampirnoMestoById(
//                            storitveKampirnihMest[index].kampirnoMesto)
//                            .avtokamp)
//                        .naziv}, Kampirno mesto:${getKampirnoMestoById(
//                        storitveKampirnihMest[index].kampirnoMesto)
//                        .naziv}, Storitev ${storitveKampirnihMest[index]}',
//                        style: TextStyle(fontSize: 10),)),
//                );
//            }
//        ));
    }

    List<StoritevKampirnegaMesta> getStoritveZaUporabnika() {
        List<int> kampirnaMesta = getRezerviranaKampirnaMestaZaUporabnika();
        List<StoritevKampirnegaMesta> storitveKampirnihMest = [];
        for (StoritevKampirnegaMesta storitevKampirnegaMesta in globals
            .storitveKampirnihMest) {
            if (kampirnaMesta.contains(storitevKampirnegaMesta.kampirnoMesto)) {
                storitveKampirnihMest.add(storitevKampirnegaMesta);
            }
        }
        return storitveKampirnihMest;
    }

    KampirnoMesto getKampirnoMestoById(mestoId) {
        for (KampirnoMesto kampirnoMesto in globals.kampirnaMesta) {
            if (kampirnoMesto.id == mestoId) {
                return kampirnoMesto;
            }
        }
    }

    Avtokamp getKampById(int kampId) {
        for (Avtokamp avtokamp in globals.avtokampi) {
            if (avtokamp.id == kampId) {
                return avtokamp;
            }
        }
    }

    List<int> getRezerviranaKampirnaMestaZaUporabnika() {
        List<int> kampirnaMesta = [];
        for (Rezervacija r in globals.rezervacije) {
            if (r.uporabnik == globals.currentUser.id) {
                kampirnaMesta.add(r.kampirnoMesto);
            }
        }
        return kampirnaMesta;
    }

    Future<bool> getData() async {
        await Future<dynamic>.delayed(const Duration(milliseconds: 50));
        return true;
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            color: FintnessAppTheme.background,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                    children: <Widget>[
                        getMainListViewUI(),
                        getAppBarUI(),
                        SizedBox(
                            height: MediaQuery
                                .of(context)
                                .padding
                                .bottom,
                        )
                    ],
                ),
            ),
        );
    }

    Widget getMainListViewUI() {
        return FutureBuilder<bool>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                    return const SizedBox();
                } else {
                    return ListView.builder(
                        controller: scrollController,
                        padding: EdgeInsets.only(
                            top: AppBar().preferredSize.height +
                                MediaQuery
                                    .of(context)
                                    .padding
                                    .top +
                                24,
                            bottom: 62 + MediaQuery
                                .of(context)
                                .padding
                                .bottom,
                        ),
                        itemCount: listViews.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                            widget.animationController.forward();
                            return listViews[index];
                        },
                    );
                }
            },
        );
    }

    Widget getAppBarUI() {
        return Column(
            children: <Widget>[
                AnimatedBuilder(
                    animation: widget.animationController,
                    builder: (BuildContext context, Widget child) {
                        return FadeTransition(
                            opacity: topBarAnimation,
                            child: Transform(
                                transform: Matrix4.translationValues(
                                    0.0, 30 * (1.0 - topBarAnimation.value),
                                    0.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: FintnessAppTheme.white
                                            .withOpacity(topBarOpacity),
                                        borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(32.0),
                                        ),
                                        boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: FintnessAppTheme.grey
                                                    .withOpacity(
                                                    0.4 * topBarOpacity),
                                                offset: const Offset(1.1, 1.1),
                                                blurRadius: 10.0),
                                        ],
                                    ),
                                    child: Column(
                                        children: <Widget>[
                                            SizedBox(
                                                height: MediaQuery
                                                    .of(context)
                                                    .padding
                                                    .top,
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16,
                                                    right: 16,
                                                    top: 16 - 8.0 *
                                                        topBarOpacity,
                                                    bottom: 12 - 8.0 *
                                                        topBarOpacity),
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    children: <Widget>[
                                                        Expanded(
                                                            child: Padding(
                                                                padding: const EdgeInsets
                                                                    .all(8.0),
                                                                child: Text(
                                                                    'Ostalo',
                                                                    textAlign: TextAlign
                                                                        .left,
                                                                    style: TextStyle(
                                                                        fontFamily: FintnessAppTheme
                                                                            .fontName,
                                                                        fontWeight: FontWeight
                                                                            .w700,
                                                                        fontSize: 22 +
                                                                            6 -
                                                                            6 *
                                                                                topBarOpacity,
                                                                        letterSpacing: 1.2,
                                                                        color: FintnessAppTheme
                                                                            .darkerText,
                                                                    ),
                                                                ),
                                                            ),
                                                        ),
                                                        SizedBox(
                                                            height: 38,
                                                            width: 38,
                                                            child: InkWell(
                                                                highlightColor: Colors
                                                                    .transparent,
                                                                borderRadius: const BorderRadius
                                                                    .all(
                                                                    Radius
                                                                        .circular(
                                                                        32.0)),
                                                                onTap: () {},
                                                                child: Center(
                                                                    child: Icon(
                                                                        Icons
                                                                            .keyboard_arrow_left,
                                                                        color: FintnessAppTheme
                                                                            .grey,
                                                                    ),
                                                                ),
                                                            ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets
                                                                .only(
                                                                left: 8,
                                                                right: 8,
                                                            ),
                                                            child: Row(
                                                                children: <
                                                                    Widget>[
                                                                    Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            right: 8),
                                                                        child: Icon(
                                                                            Icons
                                                                                .calendar_today,
                                                                            color: FintnessAppTheme
                                                                                .grey,
                                                                            size: 18,
                                                                        ),
                                                                    ),
                                                                    Text(
                                                                        'Koledar',
                                                                        textAlign: TextAlign
                                                                            .left,
                                                                        style: TextStyle(
                                                                            fontFamily: FintnessAppTheme
                                                                                .fontName,
                                                                            fontWeight: FontWeight
                                                                                .normal,
                                                                            fontSize: 18,
                                                                            letterSpacing: -0.2,
                                                                            color: FintnessAppTheme
                                                                                .darkerText,
                                                                        ),
                                                                    ),
                                                                ],
                                                            ),
                                                        ),
                                                        SizedBox(
                                                            height: 38,
                                                            width: 38,
                                                            child: InkWell(
                                                                highlightColor: Colors
                                                                    .transparent,
                                                                borderRadius: const BorderRadius
                                                                    .all(
                                                                    Radius
                                                                        .circular(
                                                                        32.0)),
                                                                onTap: () {},
                                                                child: Center(
                                                                    child: Icon(
                                                                        Icons
                                                                            .keyboard_arrow_right,
                                                                        color: FintnessAppTheme
                                                                            .grey,
                                                                    ),
                                                                ),
                                                            ),
                                                        ),
                                                    ],
                                                ),
                                            )
                                        ],
                                    ),
                                ),
                            ),
                        );
                    },
                )
            ],
        );
    }
}
