import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:thegarlanded/helper/app_localizations.dart';
import 'package:thegarlanded/routing/screenarguments.dart';
import 'package:thegarlanded/widgets/animatedContainerWidget.dart';
import 'package:thegarlanded/widgets/setting_wedget.dart';
import 'details.dart';
import 'package:http/http.dart' as http;

var itemIndex;
var indexI;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> bookName = [
    "هديه ﷺ في الوضوء",
    "هديه ﷺ في الصلاة",
  ];


  Future getBookNameUrl() async {
    var url = 'https://github.com/alheekmahlib/thegarlanded/blob/master/bookName.json?raw=true';
    // var url = 'http://alheekmahlib.com/thegarlanded/bookName.json';
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    return data;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getBookNameUrl(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                color: Theme
                    .of(context)
                    .backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الْقَلَائِدَ',
                            style: TextStyle(
                                color: Theme
                                    .of(context)
                                    .primaryColorLight,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Tajawal'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'ما يُقَلَّدُ به الهَديُ علامة له ليعرف انه هدي',
                        style: TextStyle(
                            color: Theme
                                .of(context)
                                .primaryColorLight,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Tajawal'),
                      ),
                    ],
                  ),
                ),
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
                      .height / 1.3 * .9,
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
                          height: 70,
                          decoration: BoxDecoration(
                              color: Theme
                                  .of(context)
                                  .bottomAppBarColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 22.0),
                            child: Text(
                              'الكتب',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Tajawal'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 90, right: 16, left: 16),
                        child: GridView.builder(
                            itemCount: snapshot.data.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 1.4 / 2),
                            itemBuilder: (context, index) =>
                                GestureDetector(
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
                                              '${snapshot.data[index]['bookD']}',
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
                                                    '${snapshot.data[index]['bookD']}')),
                                          ),
                                          Container(
                                            width: 120,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.only(top: 48.0),
                                              child: Text(
                                                '${snapshot.data[index]['title']}',
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
                                        '${snapshot.data[index]['title']}',
                                        '${snapshot.data[index]['bookQuoted']}',
                                        '${snapshot.data[index]['bookQuoted']}',
                                        '${snapshot.data[index]['aboutBook']}',
                                        '${snapshot.data[index]['bookD']}',
                                      ),
                                    );
                                  },
                                )),
                      ),
                    ],
                  )),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: AnimatedContainerWidget(
                  'الإعدادات',
                  Settings(),
                  Icon(
                    Icons.settings_outlined,
                    color: Theme
                        .of(context)
                        .bottomAppBarColor,
                  ),
                  Icon(
                    Icons.cancel,
                    color: Theme
                        .of(context)
                        .hoverColor,
                  ),
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
