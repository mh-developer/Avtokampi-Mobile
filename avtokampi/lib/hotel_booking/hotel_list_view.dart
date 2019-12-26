import 'package:best_flutter_ui_templates/globals.dart' as globals;
import 'package:best_flutter_ui_templates/hotel_booking/hotel_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'model/hotel_list_data.dart';

class HotelListView extends StatelessWidget {
    const HotelListView({Key key,
        this.hotelData,
        this.animationController,
        this.animation,
        this.callback})
        : super(key: key);

    final VoidCallback callback;
    final HotelListData hotelData;
    final AnimationController animationController;
    final Animation<dynamic> animation;

    Future<void> _ackAlert(BuildContext context, HotelListData kamp) {
        if (globals.priljubljeniKampi.contains(kamp.titleTxt)) {
            return showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text('Priljubljene'),
                        content: const Text('Kamp je že med priljubljenimi.'),
                        actions: <Widget>[
                            FlatButton(
                                child: Text('Ok'),
                                onPressed: () {
                                    Navigator.of(context).pop();
                                },
                            ),
                        ],
                    );
                },
            );
        }
        globals.priljubljeniKampi.add(kamp.titleTxt);
        return showDialog<void>(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('Priljubljene'),
                    content: const Text('Kamp dodan med priljubljene!'),
                    actions: <Widget>[
                        FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                                Navigator.of(context).pop();
                            },
                        ),
                    ],
                );
            },
        );
    }

    Future<void> _ackAlert2(BuildContext context, HotelListData kamp) {
        if (globals.priljubljeniKampi.contains(kamp.titleTxt)) {
            return showDialog(
                context: context,
                builder: (_) =>
                    NetworkGiffyDialog(
                        key: Key("Network"),
                        image: Image.network(
                            "https://i.pinimg.com/originals/99/82/e7/9982e7c21b0934a65f5ddb36bd0a9656.gif",
                            fit: BoxFit.cover,
                        ),
                        entryAnimation: EntryAnimation.TOP_LEFT,
                        buttonOkText: Text("Ok"),
                        buttonCancelText: Text("Odstrani"),
                        title: Text(
                            'PRILJUBLJENE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600),
                        ),
                        description: Text(
                            'Kamp ${kamp.titleTxt} je že med priljubljenimi! Če ga želite odstraniti kliknite Odstrani.',
                            textAlign: TextAlign.center,
                        ),
                        onOkButtonPressed: () {
                            Navigator.of(context).pop();
                        },
                        onCancelButtonPressed: () {
                            globals.priljubljeniKampi.remove(kamp.titleTxt);
                            Navigator.of(context).pop();
                        },
                    ));
        }
        return showDialog(
            context: context,
            builder: (_) =>
                NetworkGiffyDialog(
                    key: Key("Network"),
                    image: Image.network(
                        "https://i.pinimg.com/originals/99/82/e7/9982e7c21b0934a65f5ddb36bd0a9656.gif",
                        fit: BoxFit.cover,
                    ),
                    entryAnimation: EntryAnimation.TOP_LEFT,
                    buttonOkText: Text("Ok"),
                    buttonCancelText: Text("Prekliči"),
                    title: Text(
                        'PRILJUBLJENE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                        'S klikom na Ok bo kamp ${kamp.titleTxt} dodan med priljubljene!',
                        textAlign: TextAlign.center,
                    ),
                    onOkButtonPressed: () {
                        globals.priljubljeniKampi.add(kamp.titleTxt);
                        Navigator.of(context).pop();
                    },
                    onCancelButtonPressed: () {
                        Navigator.of(context).pop();
                    },
                ));
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
                            0.0, 50 * (1.0 - animation.value), 0.0),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 8, bottom: 16),
                            child: InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                    callback();
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16.0)),
                                        boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Colors.grey.withOpacity(
                                                    0.6),
                                                offset: const Offset(4, 4),
                                                blurRadius: 16,
                                            ),
                                        ],
                                    ),
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16.0)),
                                        child: Stack(
                                            children: <Widget>[
                                                Column(
                                                    children: <Widget>[
                                                        AspectRatio(
                                                            aspectRatio: 2,
                                                            child: Image.asset(
                                                                hotelData
                                                                    .imagePath,
                                                                fit: BoxFit
                                                                    .cover,
                                                            ),
                                                        ),
                                                        Container(
                                                            color: HotelAppTheme
                                                                .buildLightTheme()
                                                                .backgroundColor,
                                                            child: Row(
                                                                mainAxisAlignment: MainAxisAlignment
                                                                    .center,
                                                                crossAxisAlignment: CrossAxisAlignment
                                                                    .start,
                                                                children: <Widget>[
                                                                    Expanded(
                                                                        child: Container(
                                                                            child: Padding(
                                                                                padding: const EdgeInsets
                                                                                    .only(
                                                                                    left: 16,
                                                                                    top: 8,
                                                                                    bottom: 8),
                                                                                child: Column(
                                                                                    mainAxisAlignment:
                                                                                    MainAxisAlignment
                                                                                        .center,
                                                                                    crossAxisAlignment:
                                                                                    CrossAxisAlignment
                                                                                        .start,
                                                                                    children: <
                                                                                        Widget>[
                                                                                        Text(
                                                                                            hotelData
                                                                                                .titleTxt,
                                                                                            textAlign: TextAlign
                                                                                                .left,
                                                                                            style: TextStyle(
                                                                                                fontWeight: FontWeight
                                                                                                    .w600,
                                                                                                fontSize: 22,
                                                                                            ),
                                                                                        ),
                                                                                        Row(
                                                                                            crossAxisAlignment:
                                                                                            CrossAxisAlignment
                                                                                                .center,
                                                                                            mainAxisAlignment:
                                                                                            MainAxisAlignment
                                                                                                .start,
                                                                                            children: <
                                                                                                Widget>[
                                                                                                Text(
                                                                                                    hotelData
                                                                                                        .subTxt,
                                                                                                    style: TextStyle(
                                                                                                        fontSize: 14,
                                                                                                        color: Colors
                                                                                                            .grey
                                                                                                            .withOpacity(
                                                                                                            0.8)),
                                                                                                ),
                                                                                                const SizedBox(
                                                                                                    width: 4,
                                                                                                ),
                                                                                                Icon(
                                                                                                    FontAwesomeIcons
                                                                                                        .mapMarkerAlt,
                                                                                                    size: 12,
                                                                                                    color: HotelAppTheme
                                                                                                        .buildLightTheme()
                                                                                                        .primaryColor,
                                                                                                ),
                                                                                                Expanded(
                                                                                                    child: Text(
                                                                                                        '${hotelData
                                                                                                            .dist}',
                                                                                                        overflow:
                                                                                                        TextOverflow
                                                                                                            .ellipsis,
                                                                                                        style: TextStyle(
                                                                                                            fontSize: 14,
                                                                                                            color: Colors
                                                                                                                .grey
                                                                                                                .withOpacity(
                                                                                                                0.8)),
                                                                                                    ),
                                                                                                ),
                                                                                            ],
                                                                                        ),
                                                                                        Padding(
                                                                                            padding: const EdgeInsets.only(top: 4),
                                                                                            child: Row(
                                                                                                children: <Widget>[
                                                                                                    SmoothStarRating(
                                                                                                        allowHalfRating: true,
                                                                                                        spacing: 1,
                                                                                                        starCount: 5,
                                                                                                        rating: hotelData.rating,
                                                                                                        size: 20,
                                                                                                        color: HotelAppTheme
                                                                                                            .buildLightTheme()
                                                                                                            .primaryColor,
                                                                                                        borderColor: HotelAppTheme
                                                                                                            .buildLightTheme()
                                                                                                            .primaryColor,
                                                                                                    ),
                                                                                                    Text('    Število mnenj: ${hotelData.reviews.toString()}',
                                                                                                        style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                                                                                                    ),
                                                                                                ],
                                                                                            ),
                                                                                        ),
                                                                                    ],
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ),
                                                                    Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            right: 16,
                                                                            top: 8),
                                                                        child: Column(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .center,
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .end,
                                                                            children: <
                                                                                Widget>[
                                                                                Text(
                                                                                    '\€${hotelData
                                                                                        .perNight}',
                                                                                    textAlign: TextAlign
                                                                                        .left,
                                                                                    style: TextStyle(
                                                                                        fontWeight: FontWeight
                                                                                            .w600,
                                                                                        fontSize: 22,
                                                                                    ),
                                                                                ),
                                                                                Text(
                                                                                    '/na noč',
                                                                                    style: TextStyle(
                                                                                        fontSize: 14,
                                                                                        color:
                                                                                        Colors
                                                                                            .grey
                                                                                            .withOpacity(
                                                                                            0.8)),
                                                                                ),
                                                                            ],
                                                                        ),
                                                                    ),
                                                                ],
                                                            ),
                                                        ),
                                                    ],
                                                ),
                                                Positioned(
                                                    top: 8,
                                                    right: 8,
                                                    child: Material(
                                                        color: Colors
                                                            .transparent,
                                                        child: InkWell(
                                                            borderRadius: const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    32.0),
                                                            ),
                                                            onTap: () {
                                                                _ackAlert2(
                                                                    context,
                                                                    hotelData);
                                                            },
                                                            child: Padding(
                                                                padding: const EdgeInsets
                                                                    .all(8.0),
                                                                child: Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: HotelAppTheme
                                                                        .buildLightTheme()
                                                                        .primaryColor,
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                )
                                            ],
                                        ),
                                    ),
                                ),
                            ),
                        ),
                    ),
                );
            },
        );
    }
}
