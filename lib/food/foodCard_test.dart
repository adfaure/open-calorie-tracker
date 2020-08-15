import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_weight/database/db_helper.dart';
import 'package:open_weight/food/foodCard.dart';

void main() {

  final food = FoodModel
  (id: 0, name: "test", calorie: 42, portion: 100, unit: "g",);

  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(FoodCardTestWidget(food: food,));

    final iconFinder = find.text('t');
    final nameFinder = find.text('test');
    final detailFinder = find.text("Calories. ${food.calorie} (${food.portion}${food.unit})");

    expect(iconFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
    expect(detailFinder, findsOneWidget);
  });
}

class FoodCardTestWidget extends StatelessWidget {
  final food;

  const FoodCardTestWidget({ 
    @required this.food
  }) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: FoodCard(food: food,),
        ),
      ),
    );
  }
  
}
