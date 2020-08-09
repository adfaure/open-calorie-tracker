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
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:moor/moor.dart';
import 'package:flutter/foundation.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:openfoodfacts/utils/ProductQueryConfigurations.dart';
import 'package:provider/provider.dart';

import '../application_localization.dart';

scanAndAddProduct(BuildContext build) async {
  String _scanBarcode = "UNKNOW";

  _scanBarcode = await scanBarcodeNormal(build);
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
  ProductResult result;
  try {
    result = await OpenFoodAPIClient.getProduct(configurations, user: null);
  } on SocketException catch (error) {
    var snackBar = SnackBar(
      content: Text(AppLocalizations.of(build).networkErrorMessage),
    );

    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    Scaffold.of(build).showSnackBar(snackBar);
    return;
  }

  if (result.status != 1) {
    final snackBar = SnackBar(
      content: Text(
          '${AppLocalizations.of(build).networkErrorMessage}: ${result.statusVerbose}.'),
    );

    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    Scaffold.of(build).showSnackBar(snackBar);
    return;
  }
  var product = result.product;
  var unitQuantity = "g";
  var servingUnit;
  var servingSize;

  if (product.nutriments.energyKcal == null &&
      product.nutriments.energy == null) {
    final snackBar = SnackBar(
      content: Text(
          '${AppLocalizations.of(build).networkErrorMessage}: ${AppLocalizations.of(build).noEnergyInformationsFor} ${product.productName}'),
    );

    // Find the Scaffold in the widget tree and use
    // it to show a SnackBar.
    Scaffold.of(build).showSnackBar(snackBar);
    return;
  }

  if (product.quantity != null) {
    // AFAIK Serving is in form of: "number unit"  for example "54 ml"
    var splitedServing = product.quantity.split(new RegExp('\\s+'));

    // TODO: the quantity has inconsistent formating
    // Here some anomalies: (barcode: 3111950215400)
    // The second value should be the unit
    if (splitedServing.length > 2) {
      unitQuantity = splitedServing[1];
    }
  }

  if (product.nutriments.energyKcal == null) {
    var kjoulesToKcal = 0.239006;
    product.nutriments.energyKcal = product.nutriments.energy * kjoulesToKcal;
    debugPrint(
        "No kcal information (Converting from Joules) ${product.nutriments.energy} -> ${product.nutriments.energyKcal}");
  }

  if (product.servingSize != null) {
    debugPrint("Serving Size: ${product.servingSize}");
    // AFAIK Serving is in form of: "number unit"  for example "54 ml"
    var splitedServing = product.servingSize.split(new RegExp('\\s+'));
    // We try parsing the serving value, tryParse returns null on failure
    servingSize = int.tryParse(splitedServing[0]);
    // if it did not fail, we get the unit value
    if (servingSize != null) servingUnit = splitedServing[1];
  }

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
        unit: unitQuantity,
        portion: 100,
        serving: Value<int>(servingSize),
        servingUnit: Value<String>(servingUnit)));
  }
}

// Platform messages are asynchronous, so we initialize in an async method.
Future<String> scanBarcodeNormal(BuildContext context) async {
  String barcodeScanRes;
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.BARCODE);
    print(barcodeScanRes);
  } on PlatformException {
    barcodeScanRes = AppLocalizations.of(context).sancFailPlatformError;
  }

  return barcodeScanRes;
}
