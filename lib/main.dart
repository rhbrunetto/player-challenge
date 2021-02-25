import 'package:challenge/blocs/artist.dart';
import 'package:challenge/blocs/audio.dart';
import 'package:challenge/resources/constraints.dart';
import 'package:challenge/resources/palette.dart';
import 'package:challenge/screens/artist/artist.dart';
import 'package:challenge/screens/artist/list.dart';
import 'package:challenge/screens/artist/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ArtistBloc()),
        BlocProvider(create: (context) => AudioBloc()),
      ],
      child: MaterialApp(
        title: 'CookieJar MediaPlayer!',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            bodyText1: const TextStyle(
              color: Palette.darkGrey,
              fontSize: Constraints.fontSizeSmall,
            ),
            headline1: const TextStyle(
              color: Palette.black,
              fontSize: Constraints.fontSizeHuge,
              fontWeight: FontWeight.bold,
            ),
            headline2: const TextStyle(
              color: Palette.black,
              fontSize: Constraints.fontSizeSmall,
              fontWeight: FontWeight.w400,
            ),
            headline3: const TextStyle(
              color: Palette.darkGrey,
              fontSize: Constraints.fontSizeExtraLarge,
              fontWeight: FontWeight.bold,
            ),
            headline4: const TextStyle(
              color: Palette.grey,
              fontSize: Constraints.fontSizeExtraLarge,
              fontWeight: FontWeight.bold,
            ),
            subtitle1: const TextStyle(
              color: Colors.white,
              fontSize: Constraints.fontSizeNormal,
            ),
            subtitle2: const TextStyle(
              color: Palette.grey,
              fontSize: Constraints.fontSizeNormal,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: _ScrollBehavior(),
            child: child,
          );
        },
        // home: ArtistListScreen(),
        home: PlayerScreen(),
      ),
    );
  }
}

// Used to remove overscroll glow
class _ScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) =>
      child;
}
