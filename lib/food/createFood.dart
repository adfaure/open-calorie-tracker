
import 'package:flutter/material.dart';
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:provider/provider.dart';
// Column is defined both in dart and moore, hence importing both libraries is conflictual
import 'package:moor/moor.dart' hide Column;

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

String _requiredTextField(String value) {
  if (value.isEmpty) {
    return 'This field is required.';
  }
  return null;
}

class _CreateFoodFormState extends State<CreateFoodForm> {
  final _createFoodFormKey = GlobalKey<FormState>();
  final nameFormCtrl = TextEditingController();
  final brandFormCtrl = TextEditingController();

  final portionFormCtrl = TextEditingController();
  final calorieFormCtrl = TextEditingController();
  final unitFormCtrl = TextEditingController();
  final portionPerContainerFormCtrl = TextEditingController();

  final bgColor = Color(0xFFe3e3e3);
  final title = "Create new food";
  final scaleTextFieldDescription = 0.8;
  final scaleCategoryDescription = 0.9;
  final scaleTextField = 0.7;

  @override
  Widget build(BuildContext build) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Form(
            key: _createFoodFormKey,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                child: ListView(
                    children: _buildNewFood(context) +
                        [SizedBox(height: 15)] +
                        _buildNewPortion(context)))),
        floatingActionButton: Consumer<MyDatabase>(
          builder: (builder, database, child) {
            debugPrint('movieTitle: $database');
            return FloatingActionButton(
                onPressed: () {
                  if (_createFoodFormKey.currentState.validate()) {
                    debugPrint(
                        "portion: ${portionFormCtrl.text}, calorie: ${calorieFormCtrl.text}");
                    database.addTodo(FoodsCompanion.insert(
                        name: nameFormCtrl.text,
                        unit: unitFormCtrl.text,
                        calorie:
                            Value<double>(double.parse(calorieFormCtrl.text)),
                        portion:
                            Value<double>(double.parse(portionFormCtrl.text))));

                    Navigator.pop(context);
                  }
                },
                tooltip: 'Increment',
                child: Icon(Icons.check));
          },
        ));
  }

  List<Widget> _buildNewFood(BuildContext context) {
    return [
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
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))
            ],
          )),
      boxedContainer(Padding(
          padding: EdgeInsets.all(5),
          child: Column(children: [
            Row(children: [
              Text("Food name (Required)",
                  textScaleFactor: scaleTextFieldDescription,
                  style: TextStyle(fontWeight: FontWeight.bold))
            ]),
            Container(
                child: TextFormField(
              validator: _requiredTextField,
              textDirection: TextDirection.ltr,
              controller: nameFormCtrl,
              decoration: InputDecoration(hintText: "Durian fruit"),
            )),
            SizedBox(
              height: 15,
            ),
            // SizedBox(height: 15),
            Row(children: [
              Text("Brand (Optional):",
                  textScaleFactor: scaleTextFieldDescription,
                  style: TextStyle(fontWeight: FontWeight.bold))
            ]),
            Container(
                child: TextFormField(
              textDirection: TextDirection.ltr,
              controller: brandFormCtrl,
              decoration: InputDecoration(hintText: "Raw"),
            )),
          ])))
    ];
  }

  List<Widget> _buildNewPortion(BuildContext context) {
    return [
      Container(
          color: Colors.blue,
          child: Row(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Enter portion size",
                    textScaleFactor: scaleCategoryDescription,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))
            ],
          )),
      boxedContainer(Padding(
          padding: EdgeInsets.all(5),
          child: Column(children: [
            Row(children: [
              Expanded(
                  child: Text("Portion (Required)",
                      textScaleFactor: scaleTextFieldDescription,
                      style: TextStyle(fontWeight: FontWeight.bold)))
            ]),
            Container(
                child: Row(children: [
              Flexible(
                  child: TextFormField(
                textDirection: TextDirection.ltr,
                validator: _requiredTextField,
                controller: portionFormCtrl,
                keyboardType: TextInputType.number,
              )),
              SizedBox(width: 5),
              Flexible(
                  child: TextFormField(
                textDirection: TextDirection.ltr,
                controller: unitFormCtrl,
                validator: _requiredTextField,
                decoration: InputDecoration(hintText: "Unit(s)"),
              )),
            ])),
            SizedBox(
              height: 15,
            ),
            // SizedBox(height: 15),
            Row(children: [
              Text("Calories per portion:",
                  textScaleFactor: scaleTextFieldDescription,
                  style: TextStyle(fontWeight: FontWeight.bold))
            ]),
            Container(
                child: TextFormField(
              validator: _requiredTextField,
              textDirection: TextDirection.ltr,
              keyboardType: TextInputType.number,
              controller: calorieFormCtrl,
              decoration: InputDecoration(hintText: ""),
            )),
          ])))
    ];
  }
}