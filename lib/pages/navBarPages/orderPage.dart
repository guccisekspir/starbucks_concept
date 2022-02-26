import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:starbucks_concept/helpers/drinkListHelper.dart';
import 'package:starbucks_concept/helpers/sizeHelper.dart';
import 'package:starbucks_concept/widgets/coffesWidget.dart';
import 'package:starbucks_concept/widgets/drinkSheet.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController tabController;

  SizeHelper sizeHelper = SizeHelper();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        child: Scaffold(
      body: Column(
        children: [
          const SafeArea(child: Text("Kahvenizi seçin")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Center(
              child: Material(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey.withOpacity(0.5),
                child: SizedBox(
                  height: sizeHelper.height! * 0.06,
                  width: sizeHelper.width! * 0.4,
                  child: TabBar(
                    labelPadding: EdgeInsets.zero,
                    unselectedLabelColor: Colors.white,
                    controller: tabController,
                    labelColor: Colors.green,
                    indicator: const UnderlineTabIndicator(
                        insets: EdgeInsets.symmetric(horizontal: 30),
                        borderSide: BorderSide(color: Colors.green, width: 2.0)),
                    tabs: const [
                      Tab(
                        icon: Icon(
                          LineIcons.fire,
                          size: 20,
                        ),
                        text: "Hot",
                        iconMargin: const EdgeInsets.only(bottom: 1),
                      ),
                      Tab(
                        icon: Icon(LineIcons.iceCream),
                        text: "Cold",
                        iconMargin: EdgeInsets.only(bottom: 1),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: sizeHelper.height! * 0.78,
            child: TabBarView(
              controller: tabController,
              children: const [CoffeeWidget(isHot: true), CoffeeWidget(isHot: false)],
            ),
          )
        ],
      ),
    ));
  }
}

Widget eben = SingleChildScrollView(
  child: Column(
    children: [
      DrinkSheet(
        sheetName: "Latte",
        drinks: lattesDrinks,
      ),
      const Divider(
        thickness: 1,
        endIndent: 10,
        indent: 10,
        color: Colors.black,
      ),
      DrinkSheet(
        sheetName: "Mocha",
        drinks: mochasDrinks,
      ),
      const Divider(
        thickness: 1,
        endIndent: 10,
        indent: 10,
        color: Colors.black,
      ),
      DrinkSheet(
        sheetName: "Macchiato",
        drinks: macchiatoDrinks,
      ),
      const Divider(
        thickness: 1,
        endIndent: 10,
        indent: 10,
        color: Colors.black,
      ),
      DrinkSheet(
        sheetName: "Espresso",
        drinks: espressoDrinks,
      )
    ],
  ),
);
