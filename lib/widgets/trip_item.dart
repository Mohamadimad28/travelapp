import 'package:flutter/material.dart';
import 'package:travelapp/Screens/trip_detail_screen.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  //راح نصمم بطاقات الرحلات الخاصة بكل تصنيف
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
 // final removeItem;

  TripItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.tripType,
      required this.season,
      //required this.removeItem
  });

  String get seasonText {
    switch (season) {
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Summer:
        return 'صيف';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      default:
        return 'غير معروف';
    }
  }

  String get tripTypText {
    switch (tripType) {
      case TripType.Exploration:
        return 'استكشاف';
        break;
      case TripType.Recovery:
        return 'نقاهة';
        break;
      case TripType.Activities:
        return 'انشطة';
        break;
      case TripType.Therapy:
        return 'معالجة';
        break;
      default:
        return 'غير معروف';
    }
  }

  void selectTrip(BuildContext context) {
    //راح تساعدني على فتح صفحة التفاصيل
    Navigator.of(context)
        .pushNamed(TripDetailScreen.screenRoute, arguments: id)
        .then((result) {
      if (result != null) {
        //removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7, //عشان اغير درجة الضل
        margin: const EdgeInsets.all(10), //مسافات خارجية
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ), //بستخدمها لحتى اغير شكل الشايلد الي بدنا نحدها بدخلها
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      //لتدريج اللون
                      gradient: LinearGradient(
                          begin: Alignment.topCenter, //بداية التدرج
                          end: Alignment.bottomCenter, //نهاية التدرج
                          colors: [
                        Colors.black.withOpacity(0), //الشفافية
                        Colors.black.withOpacity(0.8),
                      ],
                          stops: const [
                        //عشان احدد بداية التدرج
                        0.6, 1
                      ])),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow
                        .fade, //راح تخلي العنوان ازا كان طويل يختفي بشكل تدريجي
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration يوم '),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(seasonText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(tripTypText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
