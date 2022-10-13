import 'package:flutter/material.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoritesTrips;

  FavoritesScreen(this.favoritesTrips);

  @override
  Widget build(BuildContext context) {
    if (favoritesTrips.isEmpty) {
      return Center(
        child: Text('ليس لديك أي رحلة في قائمة المفضلة'),
      );
    }else{
      return  ListView.builder(
        //مميزات البلدير بعرض بس العناصر الي ظاهر عشاشه والباقي بظهر بس ننزل الهم
        itemBuilder: (context, index) {
          //الميثود الي راح نستدعيها لكل عنصر من العناصر
          return TripItem(
            id: favoritesTrips![index].id,
            title: favoritesTrips![index].title,
            imageUrl: favoritesTrips![index].imageUrl,
            duration:favoritesTrips![index].duration,
            tripType: favoritesTrips![index].tripType,
            season: favoritesTrips![index].season,
            //removeItem: _removeTrip,

          ); //راح تكون للودجيت الخاصة بكل رحلة
        },
        itemCount: favoritesTrips!.length, //عشان نحط عدد العناصر الموجوده عنا
      );
    }
  }
}
