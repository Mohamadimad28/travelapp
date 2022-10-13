//مخصص لكيف راح يتم استخدام البيانات الخاصة بكل رحلة
import 'package:flutter/material.dart';

enum Season {
  //لفصول السنة
  Winter,
  Spring,
  Summer,
  Autumn,
}
enum TripType {
  //لنوع الرحل تعتي
  Exploration,
  Recovery,
  Activities,
  Therapy,
}

class Trip {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> activities;
  final List<String> program;
  final int duration;
  final Season season; //عشان نحدد باي فصل من فصول السنة الرحلة
  final TripType tripType;

  //هدول التلات قيم لصفحة الفلترة
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

 const Trip(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.activities,
      required this.program,
      required this.duration,
      required this.season,
      required this.tripType,
      required this.isInSummer,
      required this.isInWinter,
      required this.isForFamilies});
}
