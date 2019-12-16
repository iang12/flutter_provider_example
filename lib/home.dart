import 'package:flutter/material.dart';
import 'package:flutter_provider_example/hero_model.dart';
import 'package:flutter_provider_example/heroes_controller.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _buildList() {
    HeroesControler heroesController = Provider.of<HeroesControler>(context);

    return ListView.builder(
      itemCount: heroesController.heroes.length,
      itemBuilder: (context, index) {
        return _buildItems(heroesController.heroes[index]);
      },
    );
  }

  _buildItems(HeroModel model) {
    HeroesControler heroesControler = Provider.of<HeroesControler>(context);
    return ListTile(
      onTap: () {
        heroesControler.checkFavorite(model);
      },
      title: Text(model.name),
      trailing: model.isFavorite
          ? Icon(
              Icons.star,
              color: Colors.yellow,
            )
          : Icon(
              Icons.star_border,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Consumer<HeroesControler>(
          builder: (context, heroesController, widget) {
            return Center(
              child: Text(
                '${heroesController.heroes.where((i) => i.isFavorite).length}',
                style: TextStyle(fontSize: 20),
              ),
            );
          },
        ),
        title: Text('heroes'),
      ),
      body: Consumer<HeroesControler>(
        builder: (context, heroesController, widget) {
          return _buildList();
        },
      ),
    );
  }
}
