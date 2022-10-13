import 'package:flutter/material.dart';
import 'package:travelapp/app_data.dart';

class TripDetailScreen extends StatelessWidget {
//صفحة تفاصيل الرحلة
  static const screenRoute = '/trip-detail';
  final manageFavorite;
  final isFavorite;

  TripDetailScreen(this.manageFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    //فريبل سليكت عشان تخزن ونحصل على الرحلة الي تم اختيارها
    final selectTrip = Trips_data.firstWhere((trip) => trip.id == tripId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectTrip.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'الانشطة'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).colorScheme.primary,
                  elevation: 0.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectTrip.activities[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            buildSectionTitle(context, 'البرنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        //القسم الي على اليمين
                        child: Text(
                          'يوم${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.deepPurple,
                      ),
                      title: Text(
                        selectTrip.program[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed:()=> manageFavorite(tripId),
        // (){
        //   Navigator.of(context).pop(tripId);//للحدف وازالة السكرين
        // },
        //(){
        //   Navigator.of(context).pop(mealId);
        // } ,

        child: Icon(
          isFavorite(tripId) ? Icons.star : Icons.star_border
          ),
      ),
    );
  }
}
