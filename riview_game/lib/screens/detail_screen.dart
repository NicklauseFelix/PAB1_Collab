import 'package:flutter/material.dart';
_DetailScreenState createState() => _DetailScreenState();
}


class _DetailScreenState extends State<DetailScreen> {
bool _fav = false;


@override
void initState() {
super.initState();
_loadFav();
}


Future<void> _loadFav() async {
final sp = await SharedPreferences.getInstance();
final list = sp.getStringList('favorites') ?? [];
setState(() => _fav = list.contains(widget.game.id.toString()));
}


Future<void> _toggleFav() async {
final sp = await SharedPreferences.getInstance();
final list = sp.getStringList('favorites') ?? [];
final id = widget.game.id.toString();
if (list.contains(id)) {
list.remove(id);
} else {
list.add(id);
}
await sp.setStringList('favorites', list);
setState(() => _fav = list.contains(id));
}


@override
Widget build(BuildContext context) {
final g = widget.game;
return Scaffold(
appBar: AppBar(
title: Text(g.title),
actions: [
IconButton(
icon: Icon(_fav ? Icons.favorite : Icons.favorite_border),
onPressed: _toggleFav,
)
],
),
body: SingleChildScrollView(
padding: EdgeInsets.all(16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
if (g.coverUrl.isNotEmpty)
SizedBox(
height: 200,
width: double.infinity,
child: Image.network(g.coverUrl, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: Colors.grey[300], child: Icon(Icons.videogame_asset, size: 64))),
),
SizedBox(height: 12),
Text(g.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
SizedBox(height: 6),
Row(children: [Text('${g.platform} • ${g.genre}'), Spacer(), RatingStars(rating: g.rating)]),
SizedBox(height: 12),
Text('Developer: ${g.developer}'),
SizedBox(height: 6),
Text('Release: ${g.releaseDate}'),
Divider(),
Text(g.reviewText),
],
),
),
);
}
}