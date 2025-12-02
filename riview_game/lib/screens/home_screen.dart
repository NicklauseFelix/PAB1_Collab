import 'package:flutter/material.dart';
import '../models/game.dart';
import '../services/local_data_service.dart';
import '../widgets/game_card.dart';
import 'detail_screen.dart';


class HomeScreen extends StatefulWidget {
@override
_HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
List<Game> _games = [];
List<Game> _filtered = [];
String _query = '';
String _selectedGenre = 'All';


final List<String> _genres = ['All'];


@override
void initState() {
super.initState();
_load();
}


Future<void> _load() async {
final g = await LocalDataService.loadGamesFromAsset();
setState(() {
_games = g;
_filtered = g;
// build genres
final genres = g.map((e) => e.genre).toSet().toList()..sort();
_genres.addAll(genres);
});
}


void _search(String q) {
setState(() {
_query = q;
_applyFilters();
});
}


void _applyFilters() {
final q = _query.toLowerCase();
setState(() {
_filtered = _games.where((g) {
final matchQuery = g.title.toLowerCase().contains(q) || g.genre.toLowerCase().contains(q) || g.platform.toLowerCase().contains(q);
final matchGenre = _selectedGenre == 'All' ? true : g.genre == _selectedGenre;
return matchQuery && matchGenre;
}).toList();
});
}


@override
Widget build(BuildContext context) {
return SafeArea(
child: Column(
children: [
Padding(
padding: const EdgeInsets.all(12.0),
child: Row(
children: [
Expanded(
child: TextField(
}