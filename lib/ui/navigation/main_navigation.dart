import 'package:flutter/material.dart';
import 'package:themoviedb/Library/Widgets/Inhereted/provider.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_model.dart';

import '../../widgets/auth/auth_model.dart';
import '../../widgets/auth/auth_widget.dart';
import '../../widgets/main_screen/main_screen_model.dart';
import '../../widgets/main_screen/main_screen_widget.dart';
import '../../widgets/movie_details/movie_details_widget.dart';

abstract class MainNavigationRouteNames {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteNames.mainScreen
      : MainNavigationRouteNames.auth;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.auth: (context) => NotifierProvider(
          create: () => AuthModel(),
          child: AuthWidget(),
        ),
    MainNavigationRouteNames.mainScreen: (context) => NotifierProvider(
          create: () => MainScreenModel(),
          child: const MainScreenWidget(),
        ),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (context) => NotifierProvider(
            create: () => MovieDetailsModel(movieId),
            child: const MovieDetailsWidget(),
          ),
        );
      default:
        const widget = Text("Ошибка навигации!!!");
        return MaterialPageRoute(builder: (context) => widget);
    }
  }
}
