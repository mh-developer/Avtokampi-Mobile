import 'package:avtokampi/globals.dart' as globals;
import 'package:avtokampi/layouts/narocene_storitve_list.dart';
import 'package:avtokampi/layouts/storitve_forma.dart';
import 'package:avtokampi/models/Rezervacija.dart';
import 'package:avtokampi/models/StoritevKampirnegaMesta.dart';
import 'package:flutter/material.dart';

import 'fintness_app_theme.dart';

class RunningView extends StatelessWidget {
    final AnimationController animationController;
    final Animation animation;

    const RunningView({Key key, this.animationController, this.animation})
        : super(key: key);


    List<int> getRezerviranaKampirnaMestaZaUporabnika() {
        List<int> kampirnaMesta = [];
        for (Rezervacija r in globals.rezervacije) {
            if (r.uporabnik == globals.currentUser.id) {
                kampirnaMesta.add(r.kampirnoMesto);
            }
        }
        return kampirnaMesta;
    }

    getSteviloStoritevZaUporabnika() {
        List<int> kampirnaMesta = getRezerviranaKampirnaMestaZaUporabnika();
        int stevilo = 0;
        for (StoritevKampirnegaMesta storitevKampirnegaMesta in globals
            .storitveKampirnihMest) {
            if (kampirnaMesta.contains(storitevKampirnegaMesta.kampirnoMesto)) {
                stevilo++;
            }
        }
        return stevilo;
    }

    @override
    Widget build(BuildContext context) {
        return AnimatedBuilder(
            animation: animationController,
            builder: (BuildContext context, Widget child) {
                return FadeTransition(
                    opacity: animation,
                    child: new Transform(
                        transform: new Matrix4.translationValues(
                            0.0, 30 * (1.0 - animation.value), 0.0),
                        child: Column(
                            children: <Widget>[
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24, right: 24, top: 0, bottom: 0),
                                    child: Stack(
                                        overflow: Overflow.visible,
                                        children: <Widget>[
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 16, bottom: 16),
                                                child: InkWell(child: Container(
                                                    decoration: BoxDecoration(
                                                        color: FintnessAppTheme
                                                            .white,
                                                        borderRadius: BorderRadius
                                                            .only(
                                                            topLeft: Radius
                                                                .circular(8.0),
                                                            bottomLeft: Radius
                                                                .circular(8.0),
                                                            bottomRight: Radius
                                                                .circular(8.0),
                                                            topRight: Radius
                                                                .circular(8.0)),
                                                        boxShadow: <BoxShadow>[
                                                            BoxShadow(
                                                                color: FintnessAppTheme
                                                                    .grey
                                                                    .withOpacity(
                                                                    0.4),
                                                                offset: Offset(
                                                                    1.1, 1.1),
                                                                blurRadius: 10.0),
                                                        ],
                                                    ),
                                                    child: Stack(
                                                        alignment: Alignment
                                                            .topLeft,
                                                        children: <Widget>[
                                                            ClipRRect(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                    .circular(
                                                                    8.0)),
                                                                child: SizedBox(
                                                                    height: 74,
                                                                    child: AspectRatio(
                                                                        aspectRatio: 1.714,
                                                                        child: Image
                                                                            .asset(
                                                                            "assets/fitness_app/back.png"),
                                                                    ),
                                                                ),
                                                            ),
                                                            Column(
                                                                crossAxisAlignment: CrossAxisAlignment
                                                                    .start,
                                                                children: <
                                                                    Widget>[
                                                                    Row(
                                                                        children: <
                                                                            Widget>[
                                                                            Padding(
                                                                                padding: const EdgeInsets
                                                                                    .only(
                                                                                    left: 100,
                                                                                    right: 16,
                                                                                    top: 16,
                                                                                ),
                                                                                child: Text(
                                                                                    "Prijavi se na storitve!",
                                                                                    textAlign: TextAlign
                                                                                        .left,
                                                                                    style: TextStyle(
                                                                                        fontFamily:
                                                                                        FintnessAppTheme
                                                                                            .fontName,
                                                                                        fontWeight: FontWeight
                                                                                            .w500,
                                                                                        fontSize: 14,
                                                                                        letterSpacing: 0.0,
                                                                                        color:
                                                                                        FintnessAppTheme
                                                                                            .nearlyDarkBlue,
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                        ],
                                                                    ),
                                                                    Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left: 100,
                                                                            bottom: 12,
                                                                            top: 4,
                                                                            right: 16,
                                                                        ),
                                                                        child: Text(
                                                                            "Število storitev na katere ste prijavljeni: ${getSteviloStoritevZaUporabnika()}\nKliknite za prijavo!",
                                                                            textAlign: TextAlign
                                                                                .left,
                                                                            style: TextStyle(
                                                                                fontFamily: FintnessAppTheme
                                                                                    .fontName,
                                                                                fontWeight: FontWeight
                                                                                    .w500,
                                                                                fontSize: 10,
                                                                                letterSpacing: 0.0,
                                                                                color: FintnessAppTheme
                                                                                    .grey
                                                                                    .withOpacity(
                                                                                    0.5),
                                                                            ),
                                                                        ),
                                                                    ),
                                                                ],
                                                            ),
                                                        ],
                                                    ),
                                                ), onTap: () {
                                                    Navigator.push<dynamic>(
                                                        context,
                                                        MaterialPageRoute<
                                                            dynamic>(
                                                            builder: (
                                                                BuildContext context) =>
                                                                StoritveForm(),
                                                        ),
                                                    );
                                                }, onDoubleTap: () {
                                                    Navigator.push<dynamic>(
                                                        context,
                                                        MaterialPageRoute<
                                                            dynamic>(
                                                            builder: (
                                                                BuildContext context) =>
                                                                NaroceneStoritveList(),
                                                        ),
                                                    );
                                                },),
                                            ),
                                            Positioned(
                                                top: -16,
                                                left: 0,
                                                child: SizedBox(
                                                    width: 110,
                                                    height: 110,
                                                    child: Image.asset(
                                                        "assets/fitness_app/runner.png"),
                                                ),
                                            )
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ),
                );
            },
        );
    }
}
