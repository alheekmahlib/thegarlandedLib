import 'package:flutter/material.dart';
import 'package:thegarlanded/themes/custom_theme.dart';
import 'package:thegarlanded/themes/themes.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 100,
            width: 60,
            child: Card(
              color: Theme.of(context).bottomAppBarColor,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              'assets/images/book.jpg',
//                                          scale: 20,
                            ),
                          ),
                          Container(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.done,
                                  size: 40,
                                  color: Theme.of(context).brightness ==
                                      Brightness.light
                                      ? Color(0xffcdba72)
                                      : Colors.transparent)),
                        ],
                      ),
                      Container(
                        height: 30,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).primaryColorLight,
                        child: Text('فاتح',
                            style: TextStyle(
                                fontFamily: 'cairo',
                                fontSize: 12,
                                color: Theme.of(context).hoverColor)),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _changeTheme(context, MyThemeKeys.LIGHT);
                },
              ),
            ),
          ),
          Container(
            height: 100,
            width: 60,
            child: Card(
              color: Theme.of(context).bottomAppBarColor,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Center(
                            child: Image.asset(
                              'assets/images/book.jpg',
                            ),
                          ),
                          Container(
                              width: 50,
                              height: 50,
                              child: Icon(Icons.done,
                                  size: 40,
                                  color: Theme.of(context).brightness ==
                                      Brightness.dark
                                      ? Color(0xffcdba72)
                                      : Colors.transparent)),
                        ],
                      ),
                      Container(
                        height: 30,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        color: Theme.of(context).primaryColorLight,
                        child: Text('داكن',
                            style: TextStyle(
                                fontFamily: 'cairo',
                                fontSize: 12,
                                color: Theme.of(context).hoverColor)),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _changeTheme(context, MyThemeKeys.DARK);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
