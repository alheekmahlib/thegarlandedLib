
import 'package:flutter/material.dart';
import 'package:thegarlanded/routing/bookArguments.dart';
import 'package:thegarlanded/screens/page_view.dart';

class BookRoute extends ChangeNotifier{
  List<String> name = [
    'wdhua',
    'alsalat',
  ];

  bookRoute(BuildContext context, int index){
    Navigator.pushNamed(
      context,
      BookView.routeName,
      arguments: BookArguments(
        '${name[index]}',
      ),
    );
    notifyListeners();
  }
}