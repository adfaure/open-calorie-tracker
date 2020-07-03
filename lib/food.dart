import 'package:flutter/material.dart';

class CreateFoodForm extends StatefulWidget {
  CreateFoodForm({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CreateFoodFormState createState() => _CreateFoodFormState();
}

/* 
class Food extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 6, max: 32)();
  RealColumn get portion => real().nullable()();
  RealColumn get calorie => real().nullable()();
  TextColumn get unit => text()();
}
*/

Widget _boxedContainer(Widget child) {
  return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 0, // soften the shadow
            spreadRadius: 0, //extend the shadow
          )
        ],
      ),
      child: child);
}

class _CreateFoodFormState extends State<CreateFoodForm> {
  final nameFormCtrl = TextEditingController();
  final brandFormCtrl = TextEditingController();

  final portionFormCtrl = TextEditingController();
  final calorieFormCtrl = TextEditingController();
  final unitFormCtrl = TextEditingController();

  @override
  Widget build(BuildContext build) {
    final bgColor = Color(0xc7c7c7c7);
    final title = "Create new food";
    final scaleTextFieldDescription = 1.0;
    final scaleCategoryDescription = 1.2;

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Column(children: [
              Container(
                  color: Colors.blue,
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "New food",
                            textScaleFactor: scaleCategoryDescription,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )),
              _boxedContainer(Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(children: [
                    Row(children: [
                      Text("Food name (Mandatory)",
                          textScaleFactor: scaleTextFieldDescription,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                    TextField(
                      autofocus: true,
                      textDirection: TextDirection.ltr,
                      controller: nameFormCtrl,
                      decoration: InputDecoration(hintText: "Durian fruit"),
                      onEditingComplete: () =>
                          {Navigator.pop(context, nameFormCtrl.text)},
                    ),
                    Divider(
                      height: 30,
                    ),
                    // SizedBox(height: 15),
                    Row(children: [
                      Text("Brand (Optional):",
                          textScaleFactor: scaleTextFieldDescription,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ]),
                    TextField(
                      autofocus: true,
                      textDirection: TextDirection.ltr,
                      controller: brandFormCtrl,
                      decoration: InputDecoration(hintText: "Raw"),
                      onEditingComplete: () =>
                          {Navigator.pop(context, brandFormCtrl.text)},
                    ),
                  ])))
            ])));
  }
}
