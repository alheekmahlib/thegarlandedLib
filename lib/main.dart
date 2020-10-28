import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:thegarlanded/Models/bookName.dart';
import 'package:thegarlanded/helper/database_helper.dart';
import 'package:thegarlanded/provider/bookRoute.dart';
import 'package:thegarlanded/routing/bookArguments.dart';
import 'package:thegarlanded/routing/passargumentsscreen.dart';
import 'package:thegarlanded/routing/screenarguments.dart';
import 'package:thegarlanded/screens/details.dart';
import 'package:thegarlanded/screens/myhomepage.dart';
import 'package:thegarlanded/screens/page_view.dart';
import 'package:thegarlanded/themes/custom_theme.dart';
import 'package:thegarlanded/themes/themes.dart';

import 'helper/app_localizations.dart';
import 'helper/settings_helpers.dart';


typedef void ChangeLocaleCallback(Locale locale);

class Application {
  static ChangeLocaleCallback changeLocale;
}


void main() async {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context){
            return BookRoute();
          }),

        ],
        child: CustomTheme(
            initialThemeKey: MyThemeKeys.LIGHT,
            child: MyApp()),
      ));
  await init();
}

init() async {
  Map<String, Object> defaultValues = new Map();
  defaultValues["locale"] = "ar";
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // MyAppModel myAppModel;
  // @override
  // void initState() {
  //   myAppModel = MyAppModel(
  //     locale: Locale(
  //       'en',
  //       'ar',
  //     ),
  //   );
  //
  //   Application.changeLocale = null;
  //   Application.changeLocale = changeLocale;
  //
  //   var locale = SettingsHelpers.instance.getLocale();
  //   myAppModel.changeLocale(locale);
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xff161f07)));
    return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "The Garlanded",
        localizationsDelegates: [
          // ... app-specific localization delegate[s] here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ar', ''),
          // ... other locales the app supports
        ],
            // localizationsDelegates: [
            //   // myAppModel.appLocalizationsDelegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            // ],
            // supportedLocales: model.supportedLocales,
            // locale: model.locale,
            onGenerateRoute: (settings) {
              // If you push the PassArguments route
              if (settings.name == DetailsScreen.routeName) {
                // Cast the arguments to the correct type: ScreenArguments.
                final ScreenArguments args = settings.arguments;

                // Then, extract the required data from the arguments and
                // pass the data to the correct screen.
                return MaterialPageRoute(
                  builder: (context) {
                    return PassArgumentsScreen(
                      title: args.title,
                      details: args.details,
                      bookQuoted: args.bookQuoted,
                      aboutBook: args.aboutBook,
                      bookD: args.bookD,
                    );
                  },
                );
              } else if (settings.name == BookView.routeName) {
                // Cast the arguments to the correct type: ScreenArguments.
                final BookArguments book = settings.arguments;

                // Then, extract the required data from the arguments and
                // pass the data to the correct screen.
                return MaterialPageRoute(
                  builder: (context) {
                    return NameArgumentsScreen(
                      name: book.name,
                    );
                  },
                );
              }
              // The code only supports PassArgumentsScreen.routeName right now.
              // Other values need to be implemented if we add them. The assertion
              // here will help remind us of that higher up in the call stack, since
              // this assertion would otherwise fire somewhere in the framework.
              assert(false, 'Need to implement ${settings.name}');
              return null;
            },
//            supportedLocales: [
//              Locale('ar', 'SA'),
//              Locale('en', 'US'),
//            ],
//            localizationsDelegates: [
//              AppLocalizations.delegate,
//              GlobalMaterialLocalizations.delegate,
//              GlobalWidgetsLocalizations.delegate,
//            ],
//             Returns a locale which will be used by the app
//            localeResolutionCallback: (locale, supportedLocales) {
//              for (var supportedLocale in supportedLocales) {
//                if (supportedLocale.languageCode ==
//                    PrefService.getString("lang")) {
//                  return supportedLocale;
//                }
//              }
////              // If the locale of the device is not supported, use the first one
////              // from the list (English, in this case).
//              return supportedLocales.first;
//            },
            theme: CustomTheme.of(context),
            home: MyHomePage(),
              routes: {
                DetailsScreen.routeName: (context) =>
                    DetailsScreen(),
                BookView.routeName: (context) =>
                    BookView(),
              },
          );
  }

  // void changeLocale(Locale locale) {
  //   myAppModel.changeLocale(locale);
  // }
}

// class MyAppModel extends Model {
//   AppLocalizationsDelegate appLocalizationsDelegate;
//   Locale locale;
//
//   List<Locale> supportedLocales = [
//     Locale('en'),
//     Locale('ar'),
//   ];
//
//   MyAppModel({
//     @required this.locale,
//   }) {
//     appLocalizationsDelegate = AppLocalizationsDelegate(
//       locale: locale,
//       supportedLocales: supportedLocales,
//     );
//   }
//
//
//   void changeLocale(Locale locale) {
//     this.locale = locale;
//     notifyListeners();
//   }
// }

