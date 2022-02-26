import 'package:flutter/material.dart';
import 'package:starbucks_concept/helpers/drinkListHelper.dart';
import 'package:starbucks_concept/pages/models/drink.dart';
import 'package:starbucks_concept/widgets/drinkSheet.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SafeArea(
                child: SizedBox(
              height: 10,
            )),
            DrinkSheet(
              sheetName: "Beğeneceğiniz Kahveler",
              drinks: [
                Drink("White Mocha & Irish Cream", "description", "assets/mochas/Buzlu_White_Chocolate_Mocha.png", 1,
                    [tags[0], tags[1], tags[2]]),
                Drink("Blonde Latte with Extra Shot", "description", "assets/latte/blonde-latte.png", 1,
                    [tags[3], tags[5], tags[2]]),
                Drink("Fit Espresso", "description", "assets/espresso/espresso.png", 1, [tags[0], tags[1], tags[2]])
              ],
            ),
            DrinkSheet(
              sheetName: "Popüler Kahveler",
              drinks: [
                Drink("Mint Mocha", "description", "assets/mochas/Buzlu_White_Chocolate_Mocha.png", 1,
                    [tags[0], tags[1], tags[2]]),
                Drink("Banana Latte", "description", "assets/latte/blonde-latte.png", 1, [tags[3], tags[5], tags[2]]),
                Drink("Irish Espresso", "description", "assets/espresso/espresso.png", 1, [tags[0], tags[1], tags[2]])
              ],
            ),
            DrinkSheet(
              sheetName: "Özelleştirilmiş Kahveler",
              drinks: [
                Drink("White Mocha & Irish Cream", "description", "assets/mochas/Buzlu_White_Chocolate_Mocha.png", 1,
                    [tags[0], tags[1], tags[2]]),
                Drink("Blonde Latte with Extra Shot", "description", "assets/latte/blonde-latte.png", 1,
                    [tags[3], tags[5], tags[2]]),
                Drink("Fit Espresso", "description", "assets/espresso/espresso.png", 1, [tags[0], tags[1], tags[2]])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
