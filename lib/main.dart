import 'package:flutter/material.dart';
import 'package:travelapp/Screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travelapp/Screens/category_trips_screen.dart';
import 'package:travelapp/Screens/filters_screen.dart';
import 'package:travelapp/Screens/tabs_screen.dart';
import 'package:travelapp/Screens/trip_detail_screen.dart';
import 'package:travelapp/app_data.dart';
import 'package:travelapp/models/trip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> _availabeTrips = Trips_data; //دخزن البيانات فيها قبل ما اعرضها
  List<Trip> _favoritesTrips = [];

  void _changeFilters(_filterData) {
    setState(() {
      _filters = _filterData;
      _availabeTrips = Trips_data.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer == false) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter == false) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _manageFavorite(String tripId) {
    final existingIndex = _favoritesTrips.indexWhere((trip) =>
        trip.id ==
        tripId); //من خلال هاد السطر راح اعرف اذا كانت الرحلة موجودة بالقائمة ام لسه غير موجودة
    if (existingIndex >= 0) {
      setState(() {
        _favoritesTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritesTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }
  bool _isFovarite(String id){
    return _favoritesTrips.any((trip) => trip.id ==id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'ER'), //اللغة العربية
      ],
      title: 'Travel App',
      theme: ThemeData(
          fontFamily: 'RobotoCondensed',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline5: const TextStyle(
                  color: Colors.pink,
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
                headline6: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
                headline4: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 26,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
              .copyWith(secondary: Colors.amberAccent)),
      // home: const CategoriesScreen(),
      initialRoute: '/',
      //المسار الاولي
      routes: {
        '/': (ctx) => TabsScreen(_favoritesTrips),
        //الصفحة الرئيسية
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(_availabeTrips),
        //صفحة الرحلات
        //صفحة الرحلات
        TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(_manageFavorite,_isFovarite),
        FiltersScreen.routeNamed: (ctx) =>
            FiltersScreen(_changeFilters, _filters),
      },
    );
  }
}
