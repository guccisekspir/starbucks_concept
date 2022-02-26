import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starbucks_concept/helpers/sizeHelper.dart';
import 'package:starbucks_concept/pages/models/drink.dart';
import 'package:starbucks_concept/pages/subPages/specificationPage.dart';

class CoffeeDialog extends StatefulWidget {
  final SizeHelper sizeHelper;
  final Drink currentDrink;
  CoffeeDialog({Key? key, required this.sizeHelper, required this.currentDrink})
      : dialogWidth = sizeHelper.width! * 0.7,
        dialogHeight = sizeHelper.height! * 0.6,
        imageHeight = sizeHelper.height! * 0.1,
        super(key: key);
  late final double dialogWidth;
  late final double dialogHeight;
  late final double imageHeight;
  @override
  _CoffeeDialogState createState() => _CoffeeDialogState();
}

class _CoffeeDialogState extends State<CoffeeDialog> with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  int opacityDurationMs = 500;
  double opacity = 0;
  SizeHelper sizeHelper = SizeHelper();
  late Drink currentDrink;
  @override
  void initState() {
    // TODO: implement initState
    currentDrink = widget.currentDrink;
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: opacityDurationMs));

    animationController.forward();

    animationController.addListener(() {
      setState(() {
        opacity = animationController.value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          opacityDurationMs = 100;
          opacity = 0;
        });
        return true;
      },
      child: SizedBox(
        width: widget.dialogWidth,
        height: widget.dialogHeight,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Hero(
                  tag: widget.currentDrink.name + "container",
                  child: Container(
                    height: widget.dialogHeight * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [
                        Colors.green,
                        Colors.greenAccent,
                      ]),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: sizeHelper.height! * 0.2,
                  width: sizeHelper.width! * 0.25,
                  child: Hero(
                    tag: widget.currentDrink.name + "photo",
                    child: Image.asset(
                      widget.currentDrink.photoURL,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: sizeHelper.width! * 0.19,
                  top: sizeHelper.height! * 0.2,
                  child: AnimatedOpacity(
                    opacity: opacity,
                    duration: Duration(milliseconds: opacityDurationMs),
                    child: SizedBox(
                      width: sizeHelper.width! * 0.35,
                      child: AutoSizeText(currentDrink.name.toUpperCase(),
                          maxLines: 2,
                          minFontSize: 10,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    ),
                  )),
              Positioned(
                  left: sizeHelper.width! * 0.19,
                  top: sizeHelper.height! * 0.28,
                  child: AnimatedOpacity(
                    opacity: opacity,
                    duration: Duration(milliseconds: opacityDurationMs),
                    child: SizedBox(
                      width: sizeHelper.width! * 0.35,
                      child: AutoSizeText(currentDrink.description,
                          maxLines: 5,
                          minFontSize: 10,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 13,
                          )),
                    ),
                  )),
              Positioned(
                  left: sizeHelper.width! * 0.19,
                  top: sizeHelper.height! * 0.38,
                  child: AnimatedOpacity(
                    opacity: opacity,
                    duration: Duration(milliseconds: opacityDurationMs),
                    child: SizedBox(
                      width: sizeHelper.width! * 0.35,
                      child: AutoSizeText("Alerjenler",
                          maxLines: 5,
                          minFontSize: 10,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          )),
                    ),
                  )),
              Positioned(
                  left: sizeHelper.width! * 0.19,
                  top: sizeHelper.height! * 0.42,
                  child: AnimatedOpacity(
                    opacity: opacity,
                    duration: Duration(milliseconds: opacityDurationMs),
                    child: SizedBox(
                      width: sizeHelper.width! * 0.35,
                      child: Row(
                        children: [
                          const Spacer(),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/icons/beans.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/icons/milk-carton.png"),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedOpacity(
                    opacity: opacity,
                    duration: Duration(milliseconds: opacityDurationMs),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SpecificationPage(currentDrink: currentDrink)));
                      },
                      child: Text("Devam Et", style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 20)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
