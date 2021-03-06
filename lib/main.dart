import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisgen/blocs/favorite_bloc.dart';
import 'package:wisgen/blocs/loging_bloc_delegate.dart';
import 'package:wisgen/ui/pages/favorites_page.dart';
import 'package:wisgen/ui/pages/wisdom_feed_page.dart';
import 'package:bloc/bloc.dart';

void main() {
   //Logging
  BlocSupervisor.delegate = LogingBlocDelegate();

  runApp(Wisgen());
}

///Sets Global Theme, Sets Navigation Routes,
///and Publishes the [FavoriteBloc] globally.
class Wisgen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Globally Providing the Favorite BLoC as it is needed on multiple pages
    var materialApp = MaterialApp(
      routes: <String, WidgetBuilder>{
        "/favorites": (context) => FavoritesPage()
      },
      theme: _theme(),
      home: WisdomFeedPage(),
    );
    return BlocProvider(
      builder: (BuildContext context) => FavoriteBloc(),
      child: materialApp,
    );
  }

  ///Global Theme
  ThemeData _theme() {
    return ThemeData(
      primaryColor: Color.fromRGBO(56, 43, 115, 1),
      accentColor: Colors.grey,
      textTheme: TextTheme(
        headline: TextStyle(color: Colors.white, fontSize: 23),
      ),
    );
  }
}
