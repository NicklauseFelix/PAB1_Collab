import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/game.dart';
import '../services/local_data_service.dart';
import '../widgets/game_card.dart';
import 'detail_screen.dart';


class FavoriteScreen extends StatefulWidget {
@override
_FavoriteScreenState createState() => _FavoriteScreenState();
}


class _FavoriteScreenState