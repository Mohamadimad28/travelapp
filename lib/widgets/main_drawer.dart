
import 'package:flutter/material.dart';
import '../Screens/filters_screen.dart';
class AppDrawer extends StatelessWidget {
  Widget buildListTitle(String title, IconData icon,  tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.amber,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: 'RalewayBlack',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.headline6,
              ),
            ),
          SizedBox(height: 20),
          buildListTitle("الرحلات", Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTitle("الفلترة", Icons.filter_list, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeNamed);
          }),
        ],
      ),
    );
  }
}
