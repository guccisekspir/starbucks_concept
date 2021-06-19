import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_concept/helpers/drinkListHelper.dart';
import 'package:starbucks_concept/helpers/sizeHelper.dart';
import 'package:starbucks_concept/pages/models/drink.dart';
import 'package:starbucks_concept/pages/subPages/specificationPage.dart';

class DrinkSheet extends StatefulWidget {
  final String sheetName;
  final List<Drink> drinks;
  const DrinkSheet({Key? key, required this.sheetName, required this.drinks})
      : super(key: key);

  @override
  _DrinkSheetState createState() => _DrinkSheetState();
}

class _DrinkSheetState extends State<DrinkSheet> {
  late String sheetName;
  late List<Drink> drinks;

  SizeHelper sizeHelper = SizeHelper();

  @override
  void initState() {
    // TODO: implement initState
    sheetName = widget.sheetName;
    drinks = widget.drinks;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeHelper.height! * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
              width: sizeHelper.width! * 0.4,
              child: AutoSizeText(sheetName,
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: 25,
                  )),
            ),
          ),
          SizedBox(
            height: sizeHelper.height! * 0.25,
            child: ListView.builder(
                padding: EdgeInsets.all(1),
                scrollDirection: Axis.horizontal,
                itemCount: drinks.length,
                itemBuilder: (context, index) {
                  Drink currentDrink = drinks[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SpecificationPage(
                                  currentDrink: currentDrink,
                                )));
                      },
                      child: Container(
                        height: sizeHelper.height! * 0.15,
                        width: sizeHelper.width! * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent),
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Hero(
                                  tag: currentDrink.name,
                                  child: Container(
                                    height: sizeHelper.height! * 0.19,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: [
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: SizedBox(
                                                width: sizeHelper.width! * 0.13,
                                                child: AutoSizeText(
                                                    currentDrink.name
                                                        .toUpperCase(),
                                                    maxLines: 5,
                                                    minFontSize: 10,
                                                    style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    )),
                                              )),
                                          Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Wrap(
                                              runSpacing: 2,
                                              spacing: 0,
                                              children: [
                                                currentDrink.tags[0]
                                                    .getTagWidget(),
                                                currentDrink.tags[1]
                                                    .getTagWidget(),
                                                currentDrink.tags[2]
                                                    .getTagWidget()
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                            Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                height: sizeHelper.height! * 0.15,
                                width: sizeHelper.width! * 0.15,
                                child: Image.asset(
                                  currentDrink.photoURL,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
