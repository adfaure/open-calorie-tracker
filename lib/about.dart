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

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

/// Focus on a modifiable food entry.
class AboutView extends StatelessWidget {
  final scaleFactor = 1.2;
  final controller = ScrollController();

  var _markdownData = '''
# Open Calorie Tracker

## Licensing

This project is distributed under the GPL3 License.

The source code is located at:
[open-calorie-tracker](https://framagit.org/adfaure/open-calorie-tracker).

## Bugs, Feature requests

Feel free to send features requests or issues directly on the issue page: [issues](https://framagit.org/adfaure/open-calorie-tracker/-/issues).

You also can contact me at adrien.faure@protonmail.com.

## Acknowledgement

This application has been made possible thanks to the OpenFoodFacts database.
You can contribute to add or complete new products in the database.

For more informations:
https://world.openfoodfacts.org/
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Padding(
          child: Markdown(
            onTapLink: _launchURL,
            controller: controller,
            selectable: false,
            data: _markdownData,
          ),
          padding: EdgeInsets.all(10)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () => controller.animateTo(0,
            duration: Duration(seconds: 1), curve: Curves.easeOut),
      ),
    );
  }

  _launchURL(String url) async {
    debugPrint("open: $url");
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
