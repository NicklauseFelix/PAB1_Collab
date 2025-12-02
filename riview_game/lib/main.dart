import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/favorite_screen.dart';
import 'screens/profile_screen.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();
runApp(MyApp());
}


class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Game Reviews',
theme: ThemeData(
primarySwatch: Colors.blueGrey,
visualDensity: VisualDensity.adaptivePlatformDensity,
),
home: MainNav(),
debugShowCheckedModeBanner: false,
);
}
}


class MainNav extends StatefulWidget {
@override
_MainNavState createState() => _MainNavState();
}


class _MainNavState extends State<MainNav> {
int _selected = 0;
final _pages = [HomeScreen(), FavoriteScreen(), ProfileScreen()];


@override
Widget build(BuildContext context) {
return Scaffold(
body: _pages[_selected],
bottomNavigationBar: BottomNavigationBar(
currentIndex: _selected,
onTap: (i) => setState(() => _selected = i),
items: [
BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
],
),
);
}
}