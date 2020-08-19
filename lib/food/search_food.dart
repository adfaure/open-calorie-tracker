import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:provider/provider.dart';
import 'foodCard.dart';
import 'foodView.dart';

class SearchFood extends StatefulWidget {
  SearchFood({Key key}) : super(key: key);

  @override
  _SearchFoodState createState() => _SearchFoodState();
}

enum SearchStatus { waiting, completed }

class _SearchFoodState extends State<SearchFood> {
  String research;
  List<FoodModel> foods;
  StreamController<List<FoodModel>> _streamCtrl;

  // Cached requests
  Map<String, List<FoodModel>> cache;
  // Memoize if request is cached, and complete
  Map<String, SearchStatus> status;

  @override
  initState() {
    super.initState();
    cache = Map<String, List<FoodModel>>();
    status = Map<String, SearchStatus>();

    this.foods = List<FoodModel>();
    this._streamCtrl = StreamController();

    this._streamCtrl.stream.listen((event) {
      this.setState(() {
        foods = event;
      });
    });
    // this._streamCtrl.add(List<FoodModel>());
  }

  Widget build(BuildContext build) {
    return Column(children: <Widget>[
      Card(
          margin: EdgeInsets.all(0),
          child: ListTile(
              leading: Icon(Icons.search),
              trailing: Icon(
                FontAwesomeIcons.barcode,
                color: Colors.red,
              ),
              title: Consumer<MyDatabase>(builder: (builder, database, child) {
                return TextField(
                  onChanged: (search) {
                    _search(search, database);
                  },
                );
              }))),
      Expanded(
          child: ListView.builder(
        // When the widget is first initialize, the data is null.
        // Tertiary operators prevent getting an error (It might be seen as a workaround, idk yet)
        itemCount: foods.length,
        itemBuilder: (_, index) {
          return new GestureDetector(
              onTap: () async {
                _showFoodView(context, foods[index]);
              },
              child: FoodCard(
                food: foods[index],
              ));
        },
      ))
    ]);
  }

  _showFoodView(BuildContext context, FoodModel food) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FoodView(
                food: food,
              )),
    );
  }

  _search(String search, MyDatabase database) async {
    if (search.length < 3) {
      _streamCtrl.add([]);
      return;
    }

    if (status.containsKey(search)) {
      if (status[search] == SearchStatus.waiting) {
        // If the request is waiting nothing to do but wait
        debugPrint("Waiting: $search");
        return;
      } else {
        _streamCtrl.add(cache[search]);
      }
    }

    // The search is performed in two phases.
    // First, I look for the aliment that start with the looked string, and then I look for aliment that contains the string.
    status[search] = SearchStatus.waiting;
    var all = await database.searchFood("$search%");

    _streamCtrl.add(all);
    cache[search] = all;

    var generic = await database.searchFood("%$search%");
    all.addAll(generic);

    // Lazy way to supress duplicate
    all = all.toSet().toList();

    _streamCtrl.add(all);
    cache[search] = all;
    status[search] = SearchStatus.completed;
  }
}

/*   Widget build(BuildContext build) {
    return Column(children: <Widget>[
      Card(
          margin: EdgeInsets.all(0),
          child: ListTile(
              leading: Icon(Icons.search),
              trailing: Icon(
                FontAwesomeIcons.barcode,
                color: Colors.red,
              ),
              title: Consumer<MyDatabase>(builder: (builder, database, child) {
                return TextField(
                  onChanged: (search) async {
                    var data;
                    var strictLeft = "%$search";
                    if (search.length > 3) {
                      data = await database.searchFood(search);
                      _streamCtrl.add(data);
                    }
                  },
                );
              }))),
      Expanded(
          child: StreamBuilder(
              stream: this._streamCtrl.stream,
              initialData: List<FoodModel>(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<FoodModel>> snapshot) {
                return ListView.builder(
                  // When the widget is first initialize, the data is null.
                  // Tertiary operators prevent getting an error (It might be seen as a workaround, idk yet)
                  itemCount: snapshot.data.length ?? 0,
                  itemBuilder: (_, index) {
                    return new GestureDetector(
                        onTap: () async {
                          _showFoodView(context, snapshot.data[index]);
                        },
                        child: FoodCard(
                          food: snapshot.data[index],
                        ));
                  },
                );
              }))
    ]);
  } */
