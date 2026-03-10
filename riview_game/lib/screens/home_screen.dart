import 'package:flutter/material.dart';
import '../data/game_data.dart';
import '../widgets/game_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Game Review")),
      body: ListView.builder(
        itemCount: gameList.length,
        itemBuilder: (context, index) {
          return GameCard(
            game: gameList[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailScreen(game: gameList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
