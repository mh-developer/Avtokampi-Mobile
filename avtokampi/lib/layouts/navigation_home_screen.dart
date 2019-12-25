import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/controllers/api_data_getter.dart';
import 'package:best_flutter_ui_templates/custom_drawer/drawer_user_controller.dart';
import 'package:best_flutter_ui_templates/custom_drawer/home_drawer.dart';
import 'package:best_flutter_ui_templates/help_screen.dart';
import 'package:best_flutter_ui_templates/layouts/feedback_screen.dart';
import 'package:best_flutter_ui_templates/layouts/home_screen.dart';
import 'package:best_flutter_ui_templates/layouts/invite_friend_screen.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class NavigationHomeScreen extends StatefulWidget {
    @override
    _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
    Widget screenView;
    DrawerIndex drawerIndex;
    AnimationController sliderAnimationController;

    @override
    void initState() {
        drawerIndex = DrawerIndex.HOME;
        screenView = const MyHomePage();
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        ProgressDialog pr = new ProgressDialog(context, type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
        pr.style(
            message: 'Pridobivam podatke iz API-ja.',
            borderRadius: 10.0,
            backgroundColor: Colors.white,
            progressWidget: CircularProgressIndicator(),
            elevation: 10.0,
            insetAnimCurve: Curves.easeInOut,
            progress: 0.0,
            maxProgress: 100.0,
            progressTextStyle: TextStyle(
                color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
            messageTextStyle: TextStyle(
                color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
        );
        pr.show();
        ApiDataGetter apiDataGetter = new ApiDataGetter();
        apiDataGetter.setGlobals();
        pr.update(
            message: "Potrpite malo! Podatki so skoraj že pridobljeni.",
            progressWidget: Container(
                padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
            maxProgress: 100.0,
            progressTextStyle: TextStyle(
                color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
            messageTextStyle: TextStyle(
                color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
        );
        pr.hide();
        return Container(
            color: AppTheme.nearlyWhite,
            child: SafeArea(
                top: false,
                bottom: false,
                child: Scaffold(
                    backgroundColor: AppTheme.nearlyWhite,
                    body: DrawerUserController(
                        screenIndex: drawerIndex,
                        drawerWidth: MediaQuery
                            .of(context)
                            .size
                            .width * 0.75,
                        animationController: (
                            AnimationController animationController) {
                            sliderAnimationController = animationController;
                        },
                        onDrawerCall: (DrawerIndex drawerIndexdata) {
                            changeIndex(drawerIndexdata);
                        },
                        screenView: screenView,
                    ),
                ),
            ),
        );
    }

    void changeIndex(DrawerIndex drawerIndexdata) {
        if (drawerIndex != drawerIndexdata) {
            drawerIndex = drawerIndexdata;
            if (drawerIndex == DrawerIndex.HOME) {
                setState(() {
                    screenView = const MyHomePage();
                });
            } else if (drawerIndex == DrawerIndex.Help) {
                setState(() {
                    screenView = HelpScreen();
                });
            } else if (drawerIndex == DrawerIndex.FeedBack) {
                setState(() {
                    screenView = FeedbackScreen();
                });
            } else if (drawerIndex == DrawerIndex.Invite) {
                setState(() {
                    screenView = InviteFriend();
                });
            } else {
                //do in your way......
            }
        }
    }
}
