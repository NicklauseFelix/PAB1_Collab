import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/game.dart';


class LocalDataService {
static Future<List<Game>> loadGamesFromAsset() async {
final raw = await rootBundle.loadString('assets/data/games.json');
final list = json.decode(raw) as List<dynamic>;
return list.map((e) => Game.fromJson(e as Map<String, dynamic>)).toList();
}
}