import 'package:flutter/material.dart';
import 'package:starbucks_concept/helpers/drinkListHelper.dart';
import 'package:starbucks_concept/widgets/drinkSheet.dart';

class CoffeeWidget extends StatefulWidget {
  final bool isHot;
  const CoffeeWidget({Key? key, required this.isHot}) : super(key: key);

  @override
  _CoffeeWidgetState createState() => _CoffeeWidgetState();
}

class _CoffeeWidgetState extends State<CoffeeWidget> {
  late bool isHot;

  @override
  void initState() {
    // TODO: implement initState
    isHot = widget.isHot;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DrinkSheet(
            sheetName: "Latte",
            drinks: isHot ? lattesDrinks : icedLattesDrinks,
          ),
          Divider(
            thickness: 1,
            endIndent: 10,
            indent: 10,
            color: Colors.green,
          ),
          DrinkSheet(
            sheetName: "Mocha",
            drinks: isHot ? mochasDrinks : icedMochasDrinks,
          ),
          Divider(
            thickness: 1,
            endIndent: 10,
            indent: 10,
            color: Colors.green,
          ),
          DrinkSheet(
            sheetName: "Macchiato",
            drinks: isHot ? macchiatoDrinks : icedMacchiatoDrinks,
          ),
          Divider(
            thickness: 1,
            endIndent: 10,
            indent: 10,
            color: Colors.green,
          ),
          isHot
              ? DrinkSheet(
                  sheetName: "Espresso",
                  drinks: espressoDrinks,
                )
              : SizedBox()
        ],
      ),
    );
  }
}
