import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

enum Level { Easy, Medium, Hard }

List<String> imageArray(int id) {
  if (id == 0) {
    return [
      'images/animals/cow.png',
      'images/animals/cow.png',
      'images/animals/elephant.png',
      'images/animals/elephant.png',
      'images/animals/fox.png',
      'images/animals/fox.png',
      'images/animals/giraffe.png',
      'images/animals/giraffe.png',
      'images/animals/llama.png',
      'images/animals/llama.png',
      'images/animals/panda-bear.png',
      'images/animals/panda-bear.png',
      'images/animals/rabbit.png',
      'images/animals/rabbit.png',
      'images/animals/crocodile.png',
      'images/animals/crocodile.png',
    ];
  } else if (id == 1) {
    return [
      'images/science/back-to-school.png',
      'images/science/back-to-school.png',
      'images/science/books.png',
      'images/science/books.png',
      'images/science/flask.png',
      'images/science/flask.png',
      'images/science/lab.png',
      'images/science/lab.png',
      'images/science/microscope.png',
      'images/science/microscope.png',
      'images/science/chemistry.png',
      'images/science/chemistry.png',
      'images/science/rocket.png',
      'images/science/rocket.png',
      'images/science/chemistry-animal.png',
      'images/science/chemistry-animal.png',
    ];
  } else if (id == 2) {
    return [
      'images/nature/bee.png',
      'images/nature/bee.png',
      'images/nature/flower.png',
      'images/nature/flower.png',
      'images/nature/flowers.png',
      'images/nature/flowers.png',
      'images/nature/leaf.png',
      'images/nature/leaf.png',
      'images/nature/mushroom.png',
      'images/nature/mushroom.png',
      'images/nature/planet-earth.png',
      'images/nature/planet-earth.png',
      'images/nature/cactus.png',
      'images/nature/cactus.png',
      'images/nature/plant.png',
      'images/nature/plant.png',
    ];
  } else if (id == 3) {
    return [
      'images/birthday/balon.png',
      'images/birthday/balon.png',
      'images/birthday/birthday-cake.png',
      'images/birthday/birthday-cake.png',
      'images/birthday/animal.png',
      'images/birthday/animal.png',
      'images/birthday/animal2.png',
      'images/birthday/animal2.png',
      'images/birthday/gift.png',
      'images/birthday/gift.png',
      'images/birthday/cake.png',
      'images/birthday/cake.png',
      'images/birthday/animal3.png',
      'images/birthday/animal3.png',
      'images/birthday/ice-cream.png',
      'images/birthday/ice-cream.png',
    ];
  } else if (id == 4) {
    return [
      'images/food/bell-pepper.png',
      'images/food/bell-pepper.png',
      'images/food/carrot.png',
      'images/food/carrot.png',
      'images/food/chili-pepper.png',
      'images/food/chili-pepper.png',
      'images/food/pear.png',
      'images/food/pear.png',
      'images/food/radish.png',
      'images/food/radish.png',
      'images/food/strawberry.png',
      'images/food/strawberry.png',
      'images/food/watermelon.png',
      'images/food/watermelon.png',
      'images/food/shawarma.png',
      'images/food/shawarma.png',
    ];
  } else if (id == 5) {
    return [
      'images/christmas/cookies.png',
      'images/christmas/cookies.png',
      'images/christmas/snowman.png',
      'images/christmas/snowman.png',
      'images/christmas/reindeer.png',
      'images/christmas/reindeer.png',
      'images/christmas/santa-claus.png',
      'images/christmas/santa-claus.png',
      'images/christmas/xylophone.png',
      'images/christmas/xylophone.png',
      'images/christmas/merry-christmas.png',
      'images/christmas/merry-christmas.png',
      'images/christmas/christmas-tree.png',
      'images/christmas/christmas-tree.png',
      'images/christmas/christmas-tree-1.png',
      'images/christmas/christmas-tree-1.png',
    ];
  } else if (id == 6) {
    return [
      'images/transport/bus.png',
      'images/transport/bus.png',
      'images/transport/helicopter.png',
      'images/transport/helicopter.png',
      'images/transport/hot-air-balloon.png',
      'images/transport/hot-air-balloon.png',
      'images/transport/taxi.png',
      'images/transport/taxi.png',
      'images/transport/boat.png',
      'images/transport/boat.png',
      'images/transport/bicycle.png',
      'images/transport/bicycle.png',
      'images/transport/ambulance.png',
      'images/transport/ambulance.png',
      'images/transport/firefighter.png',
      'images/transport/firefighter.png',
    ];
  } else if (id == 7) {
    return [
      'images/wildlife/elephant.png',
      'images/wildlife/elephant.png',
      'images/wildlife/giraffe.png',
      'images/wildlife/giraffe.png',
      'images/wildlife/parrot.png',
      'images/wildlife/parrot.png',
      'images/wildlife/bear.png',
      'images/wildlife/bear.png',
      'images/wildlife/monkey.png',
      'images/wildlife/monkey.png',
      'images/wildlife/tiger.png',
      'images/wildlife/tiger.png',
      'images/wildlife/iguana.png',
      'images/wildlife/iguana.png',
      'images/wildlife/shark.png',
      'images/wildlife/shark.png',
    ];
  } else if (id == 8) {
    return [
      'images/travel/passport.png',
      'images/travel/passport.png',
      'images/travel/stamps.png',
      'images/travel/stamps.png',
      'images/travel/train.png',
      'images/travel/train.png',
      'images/travel/suitcase.png',
      'images/travel/suitcase.png',
      'images/travel/airplane.png',
      'images/travel/airplane.png',
      'images/travel/airplane-1.png',
      'images/travel/airplane-1.png',
      'images/travel/travel.png',
      'images/travel/travel.png',
      'images/travel/caravan.png',
      'images/travel/caravan.png',
    ];
  } else {
    return [
      'images/animals/cow.png',
      'images/animals/cow.png',
      'images/animals/elephant.png',
      'images/animals/elephant.png',
      'images/animals/fox.png',
      'images/animals/fox.png',
      'images/animals/giraffe.png',
      'images/animals/giraffe.png',
      'images/animals/llama.png',
      'images/animals/llama.png',
      'images/animals/panda-bear.png',
      'images/animals/panda-bear.png',
      'images/animals/rabbit.png',
      'images/animals/rabbit.png',
      'images/animals/crocodile.png',
      'images/animals/crocodile.png',
    ];
  }
}

List getLevel(Level level, int id) {
  List<String> levelType = <String>[];
  List levelArray = imageArray(id);
  if (level == Level.Hard) {
    levelArray.forEach((element) {
      levelType.add(element);
    });
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      levelType.add(levelArray[i]);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 8; i++) {
      levelType.add(levelArray[i]);
    }
  }
  levelType.shuffle();
  return levelType;
}

List<bool> getInitialItem(Level level) {
  List<bool> item = <bool>[];
  if (level == Level.Hard) {
    for (int i = 0; i < 20; i++) {
      item.add(true);
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      item.add(true);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 8; i++) {
      item.add(true);
    }
  }
  return item;
}

List<GlobalKey<FlipCardState>> getCards(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys = <GlobalKey<FlipCardState>>[];
  if (level == Level.Hard) {
    for (int i = 0; i < 20; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 12; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 8; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}
