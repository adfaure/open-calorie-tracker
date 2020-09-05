import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:provider/provider.dart';
import 'foodCard.dart';
import 'foodView.dart';
import 'openfoodfacts.dart';

class SearchFood extends StatefulWidget {
  final onTapFoodCard;
  SearchFood({Key key, this.onTapFoodCard}) : super(key: key);

  @override
  _SearchFoodState createState() => _SearchFoodState();
}

enum SearchStatus { waiting, completed }

class _SearchFoodState extends State<SearchFood> {
  String research = "";
  // Currently displayed food from active research
  List<FoodModel> foods;

  // Visible food, displayed when there is no active research
  List<FoodModel> visibleFoods;

  StreamController<List<FoodModel>> _streamCtrl;

  // Cached requests
  Map<String, List<FoodModel>> cache;
  // Memoize if request is cached, and complete
  Map<String, SearchStatus> status;

  @override
  initState() {
    super.initState();

    this.cache = Map<String, List<FoodModel>>();
    this.status = Map<String, SearchStatus>();

    this.foods = List<FoodModel>();
    this._streamCtrl = StreamController();

    this._streamCtrl.stream.listen((event) {
      this.setState(() {
        foods = event;
      });
    });

    var database = Provider.of<MyDatabase>(context, listen: false);
    database.getVisibleFoods().then((value) {
      this.visibleFoods = value;
      this._search(database);
    });

    database.watchVisibleFoods().listen((value) {
      this.visibleFoods = value;
      this._search(database);
    });
  }

  Widget build(BuildContext build) {
    return Column(children: <Widget>[
      Card(
          margin: EdgeInsets.all(0),
          child: ListTile(
              leading: Icon(Icons.search),
              trailing: IconButton(
                icon: FaIcon(FontAwesomeIcons.barcode),
                onPressed: () async {
                  scanAndAddProduct(build);
                },
              ),
              title: Consumer<MyDatabase>(builder: (builder, database, child) {
                return TextField(
                  onChanged: (search) {
                    this.research = search;
                    _search(database);
                  },
                );
              }))),
      Expanded(
          child: ListView.builder(
              // When the widget is first initialize, the data is null.
              // Tertiary operators prevent getting an error (It might be seen as a workaround, idk yet)
              itemCount: foods.length,
              itemBuilder: (_, index) {
                return Consumer<MyDatabase>(
                    builder: (builder, database, child) {
                  return GestureDetector(
                      // The default behavior is to show the food view
                      onTap: () {
                        if (this.widget.onTapFoodCard != null) {
                          this.widget.onTapFoodCard(foods[index]);
                        } else {
                          _showFoodView(context, database, foods[index]);
                        }
                      },
                      child: _foodCard(
                        database,
                        foods[index],
                      ));
                });
              }))
    ]);
  }

  _showFoodView(
      BuildContext context, MyDatabase database, FoodModel food) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FoodView(food: food)),
    );
  }

  _search(MyDatabase database) async {
    if (research.length == 0) {
      _streamCtrl.add(this.visibleFoods);
      return;
    } else if (research.length < 3) {
      _streamCtrl.add([]);
      return;
    }

    if (status.containsKey(research)) {
      if (status[research] == SearchStatus.waiting) {
        // If the request is waiting nothing to do but wait
        return;
      } else {
        _streamCtrl.add(cache[research]);
      }
    }

    // The search is performed in two phases.
    // First, I look for the aliment that start with the looked string, and then I look for aliment that contains the string.
    status[research] = SearchStatus.waiting;
    var all = await database.searchFood("$research%");

    _streamCtrl.add(all);
    cache[research] = all;

    var generic = await database.searchFood("%$research%");
    all.addAll(generic);

    // Lazy way to supress duplicate
    all = all.toSet().toList();

    _streamCtrl.add(all);
    cache[research] = all;
    status[research] = SearchStatus.completed;
  }

  _foodCard(MyDatabase database, FoodModel food) {
    var actionButton;
    // For the moment I rather not let users delete the ciqual database
    if (food.source != "ciqual") {
      actionButton = IconButton(
        icon: Icon(Icons.delete_outline),
        onPressed: () {
          var entry = food;
          database.deleteFoodModel(entry);
        },
        color: Colors.red,
      );
    }
    return FoodCard(
      food: food,
      actionButton: actionButton,
    );
  }
}
