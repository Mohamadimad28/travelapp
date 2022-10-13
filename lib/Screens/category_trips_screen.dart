//صفحة الرحلات
import 'package:flutter/material.dart';
import 'package:travelapp/models/trip.dart';
import '../app_data.dart';
import '../widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute =
      '/category-trips';
  final List<Trip> availableTrips;

 CategoryTripsScreen(this.availableTrips);
  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  String? categoryTitle;
 List<Trip>? displayTrips;
  @override
  void initState() {

    super.initState();
  }
  @override
  void didChangeDependencies() {
    final routArgument =
    ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routArgument['id'];
     categoryTitle = routArgument['title'];
    displayTrips =widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }
  void _removeTrip(String tripId){
    setState(() {
      displayTrips!.removeWhere((trip) => trip==tripId);
    });
  }
 //عشان نعرف المسار الصحيح معناهم انو بدي انشاء متغير بقدر استدعيه باي مكان من دون ما اعطيه اوبجيكت
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        //مميزات البلدير بعرض بس العناصر الي ظاهر عشاشه والباقي بظهر بس ننزل الهم
        itemBuilder: (context, index) {
          //الميثود الي راح نستدعيها لكل عنصر من العناصر
          return TripItem(
              id: displayTrips![index].id,
              title: displayTrips![index].title,
              imageUrl: displayTrips![index].imageUrl,
              duration:displayTrips![index].duration,
              tripType: displayTrips![index].tripType,
              season: displayTrips![index].season,
           // removeItem: _removeTrip,

          ); //راح تكون للودجيت الخاصة بكل رحلة
        },
        itemCount: displayTrips!.length, //عشان نحط عدد العناصر الموجوده عنا
      ),
    );
  }
}
