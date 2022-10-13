import 'package:flutter/material.dart';
import 'package:travelapp/models/trip.dart';
import 'package:travelapp/widgets/main_drawer.dart';
import '../Screens/favorites_screen.dart';
import '../Screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoritesTrips;
  const TabsScreen( this.favoritesTrips);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List _screen;
  void _selectScreen(int index){
    setState(() {
      _selectedScreenIndex=index;
    });
  }
  int _selectedScreenIndex = 0;
    void initState() {
      _screen = [
        {
          'Screen'
              : const CategoriesScreen(),
          'Title': 'تصنيفات الرحلات',
        },
        {
          'Screen':FavoritesScreen(widget.favoritesTrips),
          'Title': 'الرحلات المفضلة',
        }
      ];
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screen[_selectedScreenIndex]['Title']),
      ),
      drawer: AppDrawer(),
      body: _screen[_selectedScreenIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: const [
          //تقوم بعمل التاب
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'التصنيفات'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), label: 'المفضلة'),
        ],
      ), //تاب اسفل الشاشة
    );
  }
}

//
// class TabsScreen extends StatelessWidget {
//   //هادي الصفحة هدفها عرض شريط التاب وبالاضافة المحتوى الخاص بكل صفحة
//   const TabsScreen({Key? key}) : super(key: key);
//تاب بار العلوي
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('دليل سياحي'),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.dashboard),
//                 text: 'التصنيفات',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'المفضلة',
//               ),
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavoritesScreen(),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
