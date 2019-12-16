import 'package:flutter/material.dart';
import 'package:flutter_provider_example/hero_model.dart';


class HeroesControler extends ChangeNotifier{
  List<HeroModel> heroes = [
    HeroModel(name: 'Thor'),
    HeroModel(name: 'Ion Man'),
    HeroModel(name: 'Batman'),
    HeroModel(name: 'Captain America'),
    HeroModel(name: 'Thor'),
    HeroModel(name: 'Flash'),
  ];
  checkFavorite(HeroModel model){
    model.isFavorite = !model.isFavorite;
    notifyListeners();
  }
}
