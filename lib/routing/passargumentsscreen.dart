import 'package:flutter/material.dart';

class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String details;
  final String bookQuoted;
  final String aboutBook;
  final String bookD;

  // This Widget accepts the arguments as constructor parameters. It does not
  // extract the arguments from the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute function provided to the
  // MaterialApp widget.
  const PassArgumentsScreen({
    Key key,
    @required this.title,
    @required this.details,
    @required this.bookQuoted,
    @required this.aboutBook,
    @required this.bookD,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(details),
            Text(bookQuoted),
          ],
        ),
      ),
    );
  }
}

class NameArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String name;

  // This Widget accepts the arguments as constructor parameters. It does not
  // extract the arguments from the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute function provided to the
  // MaterialApp widget.
  const NameArgumentsScreen({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          children: [
            Text(name, style: TextStyle(
              color: Colors.white
            ),),
          ],
        ),
      ),
    );
  }
}