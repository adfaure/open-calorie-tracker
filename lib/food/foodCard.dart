import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/food/foodCard.dart';


void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  Food testEntry = Food(name: "test1", calorie: 0.0, id: 0, unit: "g", portion: 100.0);
  testWidgets('Food card dysplaying a food entry.', (WidgetTester tester) async {
    await tester.pumpWidget(FoodCard(food: testEntry));
  });

}


class FoodCard extends StatelessWidget {
  final food;
  final actionButton;

  FoodCard({@required this.food, this.actionButton});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: CircleAvatar(
            child: Text('${food.name[0]}'),
            radius: 20,
          ),
          title: Text(food.name),
          subtitle:
              Text("Calories. ${food.calorie} (${food.portion}${food.unit})"),
          trailing: actionButton),
    );
  }
}