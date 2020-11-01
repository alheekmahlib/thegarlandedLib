import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thegarlanded/Models/bookName.dart';
import 'package:thegarlanded/helper/database_helper.dart';
import 'package:thegarlanded/routing/bookArguments.dart';
import 'package:thegarlanded/routing/screenarguments.dart';
import 'package:thegarlanded/screens/page_view.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List myBook;

class DetailsScreen extends StatefulWidget {
  static const routeName = '/extractArguments';

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String name, content;
  int hours;
  DbHelper helper;
  bool _isFavorited = true;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited = false) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }

  Future getBookNameUrl() async {
    var url =
        'https://github.com/alheekmahlib/thegarlanded/blob/master/bookName.json?raw=true';
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder(
          future: getBookNameUrl(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Theme.of(context).backgroundColor,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 40, horizontal: 16),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Opacity(
                                  child: Container(
                                    width: 260,
                                    child: Image.asset(
                                      '${snapshot.data[indexI]['bookD']}',
                                    ),
                                  ),
                                  opacity: 0.1,
                                ),
                                Container(
                                  width: 160,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                          offset: Offset(10.0, 5.0),
                                          blurRadius: 15)
                                    ],
                                  ),
                                  child: Image.asset(
                                      '${snapshot.data[indexI]['bookD']}'),
                                ),
                                Container(
                                  width: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 100.0),
                                    child: Text(
                                      args.title,
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).backgroundColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Tajawal'),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          border: Border.all(
                                            width: 1,
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                          )),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 1.3 * .9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).bottomAppBarColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 44),
                                child: ListView(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 32.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1 /
                                                    2,
                                                child: Text(
                                                  args.title,
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      fontSize: 28,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Tajawal'),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Text(
                                                args.bookQuoted,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColorLight
                                                        .withOpacity(.6),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Tajawal'),
                                              ),
                                            ],
                                          ),
                                          Stack(
                                            children: [
                                              Container(
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Theme.of(context)
                                                            .primaryColorLight,
                                                        offset:
                                                            Offset(10.0, 5.0),
                                                        blurRadius: 15)
                                                  ],
                                                ),
                                                child: Image.asset(
                                                    '${snapshot.data[indexI]['bookD']}'),
                                              ),
                                              Container(
                                                width: 100,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 65.0),
                                                  child: Text(
                                                    args.title,
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .backgroundColor,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: 'Tajawal'),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 32,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Text(
                                        'عن الكتاب',
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .bottomAppBarColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Tajawal'),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Container(
                                      color: Theme.of(context)
                                          .bottomAppBarColor
                                          .withOpacity(.3),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 16),
                                        child: Text(
                                          args.aboutBook,
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .bottomAppBarColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Tajawal'),
                                          textAlign: TextAlign.justify,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .bottomAppBarColor,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(8),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      8))),
                                                  width: 260,
                                                  height: 50,
                                                  child: Center(
                                                    child: Text(
                                                      'قراءة',
                                                      style: TextStyle(
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorLight,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Tajawal'),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                    context,
                                                    BookView.routeName,
                                                    arguments: BookArguments(
                                                      '$itemIndex',
                                                    ),
                                                  );
                                                  // bookRoute.bookRoute(context, index);
                                                },
                                              ),
                                              GestureDetector(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(.8),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(8),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      8))),
                                                  width: 50,
                                                  height: 50,
                                                  child: Center(
                                                    child: (_isFavorited
                                                        ? Icon(Icons
                                                            .bookmark_border)
                                                        : Icon(Icons.bookmark,
                                                    color: Theme.of(context).accentColor,)),
                                                  ),
                                                ),
                                                onTap: () async {
                                                  var course = BookName({
                                                    'title': args.title,
                                                    'bookQuoted':
                                                        args.bookQuoted,
                                                    'aboutBook': args.aboutBook,
                                                    'bookD': args.bookD
                                                  });
                                                  int id = await helper
                                                      .createCourse(course);
                                                  print('course id is $id');
                                                  _toggleFavorite();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
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
    );
  }
}
