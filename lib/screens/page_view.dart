import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:thegarlanded/event/font_size_event.dart';
import 'package:thegarlanded/helper/my_event_bus.dart';
import 'package:thegarlanded/helper/settings_helpers.dart';
import 'package:http/http.dart' as http;
import 'homepage.dart';

class BookView extends StatefulWidget {
  static const routeName = '/passArguments';
  @override
  _BookViewState createState() => _BookViewState();
}

class _BookViewState extends State<BookView> with WidgetsBindingObserver {
  static const double maxFontSizeArabic = 45;
  double fontSizeArabic = SettingsHelpers.minFontSizeArabic;
  MyEventBus _myEventBus = MyEventBus.instance;
  StreamSubscription streamEvent;
  String text = '';
  bool isSelected = true;
  PageController controller = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    streamEvent = _myEventBus.eventBus.on<FontSizeEvent>().listen((onData) {
      if (streamEvent != null) {
        fontSizeArabic = onData.arabicFontSize;
        // fontSizeArabic = SettingsHelpers.instance.getFontSizeArabic;
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    streamEvent?.cancel();
    streamEvent = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: PageView.builder(
                      controller: controller,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16.0,
                                  left: 16.0,
                                  top: 56.0,
                                  bottom: 8.0),
                              child: ListView(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text:
                                          '${snapshot.data[index]['title']}\n\n',
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorDark,
                                        fontFamily: 'naskh',
                                        fontSize: fontSizeArabic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              '${snapshot.data[index]['text']}\n\n',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                              fontFamily: 'naskh',
                                              fontSize: fontSizeArabic,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        TextSpan(
                                          text:
                                              '${snapshot.data[index]['pageNum']}',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColorDark,
                                              fontFamily: 'naskh',
                                              fontSize: fontSizeArabic,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                            Align(
                                alignment: Alignment.topCenter,
                                child: isSelected == true
                                    ? Container(
                                        height: 48,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color:
                                            Theme.of(context).bottomAppBarColor,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            IconButton(
                                              icon: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                    )),
                                                child: Icon(
                                                  Icons.arrow_back,
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            Container(
                                              width: 150,
                                              child: Slider(
                                                min: SettingsHelpers
                                                    .minFontSizeArabic,
                                                max: maxFontSizeArabic,
                                                value: fontSizeArabic,
                                                label: '$fontSizeArabic',
                                                activeColor: Theme.of(context)
                                                    .primaryColorLight,
                                                inactiveColor: Theme.of(context)
                                                    .backgroundColor,
                                                onChanged: (double value) {
                                                  setState(() {
                                                    SettingsHelpers.instance
                                                        .fontSizeArabic(value);
                                                    fontSizeArabic = value;
                                                    _myEventBus.eventBus.fire(
                                                        FontSizeEvent()
                                                          ..arabicFontSize =
                                                              value);
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ))
                                    : null)
                          ],
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                      child: Image.asset(
                    'assets/images/Loading.gif',
                    scale: 3,
                  ));
                }
              }),
        ),
      ),
    );
  }

  Widget _tabWidget() {
    return Align(
        alignment: Alignment.topCenter,
        child: isSelected == true
            ? Container(
                height: 48,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).bottomAppBarColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).primaryColorLight,
                            )),
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Container(
                      width: 150,
                      child: Slider(
                        min: SettingsHelpers.minFontSizeArabic,
                        max: maxFontSizeArabic,
                        value: fontSizeArabic,
                        label: '$fontSizeArabic',
                        activeColor: Theme.of(context).hoverColor,
                        inactiveColor: Theme.of(context).bottomAppBarColor,
                        onChanged: (double value) {
                          setState(() {
                            SettingsHelpers.instance.fontSizeArabic(value);
                            fontSizeArabic = value;
                            _myEventBus.eventBus
                                .fire(FontSizeEvent()..arabicFontSize = value);
                          });
                        },
                      ),
                    ),
                  ],
                ))
            : null);
  }

  Future getData() async {
    var url =
        'https://github.com/alheekmahlib/thegarlanded/blob/master/$itemIndex.json?raw=true';
    // var url = 'https://palindromic-partiti.000webhostapp.com/thegaralanded/$itemIndex.json?raw=true';
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    return data;
  }
}
