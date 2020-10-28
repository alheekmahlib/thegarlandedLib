import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thegarlanded/routing/bookArguments.dart';
import 'package:http/http.dart' as http;
import 'homepage.dart';

class BookView extends StatefulWidget {
  static const routeName = '/passArguments';
  @override
  _BookViewState createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  PageController controller = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    // getData();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BookArguments name = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: FutureBuilder(
              future: getData(),
              // future: DefaultAssetBundle.of(context).loadString("assets/wudhua.json"),
              builder: (context, snapshot) {
                // var showData = json.decode(snapshot.data.toString());
                if (snapshot.connectionState == ConnectionState.done) {
                  // return ListView.builder(
                  //
                  //   itemBuilder: (BuildContext context, int index){
                  //     return ListTile(
                  //       title: Text(showData[index]['title']),
                  //       subtitle: Text(showData[index]['text']),
                  //     );
                  //   },
                  //   itemCount: showData == null ? 0 : showData.length,
                  // );
                  return PageView.builder(
                    controller: controller,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView(
                          children: [
                            Text(
                              // '${snapshot.data[index]['title']}',
                              '${snapshot.data[index]['title']}',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontFamily: 'naskh',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(height: 32,),
                            Text(
                              '${snapshot.data[index]['text']}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                                fontFamily: 'naskh',
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            Text(
                              '${snapshot.data[index]['pageNum']}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                                fontFamily: 'naskh',
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }

  Future getData() async {
    var url = 'https://github.com/alheekmahlib/thegarlanded/blob/master/$itemIndex.json?raw=true';
    // var url = 'https://palindromic-partiti.000webhostapp.com/thegaralanded/$itemIndex.json?raw=true';
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    return data;
  }
}
