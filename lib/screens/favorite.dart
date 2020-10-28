import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:thegarlanded/Models/bookName.dart';
import 'package:thegarlanded/helper/database_helper.dart';
import 'package:thegarlanded/routing/screenarguments.dart';

import 'details.dart';
import 'homepage.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  DbHelper helper;

  @override
  void initState() {
    helper = DbHelper();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: helper.allCourses(),
    builder: (context, AsyncSnapshot snapshot) {
    if (!snapshot.hasData) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Padding(
          padding: const EdgeInsets.only(top: 90, right: 16, left: 16),
          child:
          // ListView.builder(
          //   itemCount: snapshot.data.length,
          //     itemBuilder: (context, index){
          //     BookName book = BookName.fromMap(snapshot.data[index]);
          //       return Text('${book.title}');
          //     })
          GridView.builder(
      itemCount: snapshot.data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.4 / 2),
          itemBuilder: (context, index) {
            BookName book = BookName.fromMap(snapshot.data[index]);
                return GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .bottomAppBarColor
                              .withOpacity(.5),
                          borderRadius:
                          BorderRadius.all(Radius.circular(8))),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Opacity(
                            child: Image.asset(
                              '${book.bookD}',
                            ),
                            opacity: 0.1,
                          ),
                          Container(
                            width: 130,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Theme
                                        .of(context)
                                        .primaryColorLight,
                                    offset: Offset(10.0, 5.0),
                                    blurRadius: 9)
                              ],
                            ),
                            child: Card(
                                child: Image.asset(
                                    '${book.bookD}')),
                          ),
                          Container(
                            width: 120,
                            child: Padding(
                              padding:
                              const EdgeInsets.only(top: 48.0),
                              child: Text(
                                '${book.title}',
                                style: TextStyle(
                                    color: Theme
                                        .of(context)
                                        .backgroundColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Tajawal'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      )),
                  onTap: () {
                    itemIndex = snapshot.data[index]['title'];
                    indexI = index;
                    Navigator.pushNamed(
                      context,
                      DetailsScreen.routeName,
                      arguments: ScreenArguments(
                        '${book.title}',
                        '${book.bookQuoted}',
                        '${book.bookQuoted}',
                        '${book.aboutBook}',
                        '${book.bookD}',
                      ),
                    );
                  },
                );
          }),
      );
    }
    });
  }
}
