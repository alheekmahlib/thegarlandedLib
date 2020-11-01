import 'package:flutter/cupertino.dart';
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
    double padding = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: helper.allCourses(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Image.asset('assets/images/Loading.gif',
              scale: 3,));
          } else {
            return Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: padding /1/5 * 0.1),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          color: Theme.of(context).bottomAppBarColor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 32.0,
                              left: 32.0,
                              top: 13.0),
                          child: Text('المفضلة',
                            style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).backgroundColor
                            ),
                          ),
                        )
                        ),
                        Container(
                          width: 15,
                          height: 50,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 1.3 * .99,
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
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Theme
                                      .of(context)
                                      .bottomAppBarColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: padding /1/2 * .11, right: 16.0, left: 16.0),
                            child: GridView.builder(
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
                                            color: Theme.of(context)
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
                                                      color:
                                                          Theme.of(context).primaryColorLight,
                                                      offset: Offset(10.0, 5.0),
                                                      blurRadius: 9)
                                                ],
                                              ),
                                              child:
                                                  Card(child: Image.asset('${book.bookD}')),
                                            ),
                                            Container(
                                              width: 120,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top: 48.0),
                                                child: Text(
                                                  '${book.title}',
                                                  style: TextStyle(
                                                      color:
                                                          Theme.of(context).backgroundColor,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: 'Tajawal'),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context).accentColor,
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(32.0),
                                                        bottomRight: Radius.circular(8.0))),
                                                child: IconButton(
                                                  icon: Icon(Icons.delete),
                                                  onPressed: () {
                                                    setState(() {
                                                      helper.deleteCourse(book.id);
                                                    });
                                                  },
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
