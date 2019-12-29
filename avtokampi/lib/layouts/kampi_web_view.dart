import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';

class KampiWeb extends StatefulWidget {
    @override
    _KampiWebState createState() => _KampiWebState();
}

class _KampiWebState extends State<KampiWeb> {
    String url = 'https://kampiraj.ga';
    int _currentIndex = 0;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Spletna aplikacija'),
            ),
            body: EasyWebView(
                src: url,
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (val) {
                    if (mounted)
                        setState(() {
                            url = _getUrl(val);
                            _currentIndex = val;
                        });
                },
                items: [
                    BottomNavigationBarItem(
                        title: Text('Aplikacija'),
                        icon: Icon(Icons.info),
                    ),
                    BottomNavigationBarItem(
                        title: Text('API'),
                        icon: Icon(Icons.info_outline),
                    ),
                ],
            ),
        );
    }

    String _getUrl(int val) {
        switch (val) {
            case 0:
                return 'https://kampiraj.ga';
            case 1:
                return 'https://api.kampiraj.ga';
            default:
                return 'https://google.com';
        }
    }
}