/*  This file is part of the open calorie tracker project. 
 *  This application helps you to track the consumed calories on a daily basis.
 *  Copyright (C) 2020. Adrien FAURE
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>. */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:moor/moor.dart';
import 'package:open_weight/common/ui.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/models/objective.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/ProductQueryConfigurations.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

scanAndAddProduct(BuildContext build) async {
  String _scanBarcode = "UNKNOW";

  _scanBarcode = await scanBarcodeNormal();
  debugPrint("barcode testing: $_scanBarcode");
  ProductQueryConfiguration configurations =
      ProductQueryConfiguration(_scanBarcode,
          // language: OpenFoodFactsLanguage.GERMAN,
          fields: [
        ProductField.BARCODE,
        ProductField.NAME,
        ProductField.SERVING_SIZE,
        ProductField.QUANTITY,
        ProductField.BRANDS,
        ProductField.FRONT_IMAGE,
        ProductField.NUTRIMENTS,
        ProductField.NUTRIMENT_ENERGY_UNIT,
      ]);

  ProductResult result =
      await OpenFoodAPIClient.getProduct(configurations, user: null);

  if (result.status != 1) {
    print("Error retreiving the product : ${result.status}");
    return;
  }
  var product = result.product;

  var database = Provider.of<MyDatabase>(build, listen: false);
  List<FoodModel> foodModel =
      await database.getFoodModelByBarcode(product.barcode);
  debugPrint("${foodModel.toString()}");
  if (foodModel.length == 0) {
    database.addFoodModel(FoodModelsCompanion.insert(
        calorie: product.nutriments.energyKcal.round(),
        name: product.productName,
        barcode: Value<String>(product.barcode),
        source: Value<String>("OpenFoodFacts"),
        unit: "g",
        portion: 100));
  }
}

// Platform messages are asynchronous, so we initialize in an async method.
Future<String> scanBarcodeNormal() async {
  String barcodeScanRes;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.BARCODE);
    print(barcodeScanRes);
  } on PlatformException {
    barcodeScanRes = 'Failed to get platform version.';
  }

  return barcodeScanRes;
}

/// simple widget to debug the scan + add food function
/// me disapear if useless.
class OpenFoodFacts extends StatelessWidget {
  final barcodeCtlr = TextEditingController();
  final streamCtlr = StreamController<Product>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        appBar: AppBar(
          title: Text("Personal informations"),
        ),
        body: Consumer<ObjectiveModel>(builder: (builder, objModel, child) {
          return ListView(
            children: <Widget>[
              Card(
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: () async {
                          Product product = await scanAndAddProduct(context);
                          Navigator.pop(context, product);
                        },
                      ))),
            ],
          );
        }));
  }
}
