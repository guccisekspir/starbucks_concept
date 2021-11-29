import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:starbucks_concept/helpers/sizeHelper.dart';
import 'package:starbucks_concept/pages/models/drink.dart';

class SpecificationPage extends StatefulWidget {
  final Drink currentDrink;
  const SpecificationPage({Key? key, required this.currentDrink})
      : super(key: key);

  @override
  _SpecificationPageState createState() => _SpecificationPageState();
}

class _SpecificationPageState extends State<SpecificationPage> {
  SizeHelper sizeHelper = SizeHelper();
  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<double>? _typeInput;

  SMITrigger? ventiTrigger;
  SMITrigger? grandeTrigger;
  SMITrigger? tallTrigger;

  SMITrigger? chocolateTrigger;
  SMITrigger? creamTrigger;
  SMITrigger? syrupTrigger;

  TextStyle labelTextStyle = GoogleFonts.roboto(
      color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/rives/starbucks.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'State Machine 1');
        if (controller != null) {
          artboard.addController(controller);
          _typeInput = controller.findInput("isType");

          ventiTrigger = controller.findInput<bool>("venti") as SMITrigger;
          grandeTrigger = controller.findInput<bool>("grande") as SMITrigger;
          tallTrigger = controller.findInput<bool>("tall") as SMITrigger;

          chocolateTrigger =
              controller.findInput<bool>("chocolate") as SMITrigger;
          creamTrigger = controller.findInput<bool>("cream") as SMITrigger;
          syrupTrigger = controller.findInput<bool>("syrup") as SMITrigger;

          _typeInput?.value = 1;
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.currentDrink.name,
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: sizeHelper.width! * 0.5,
                height: sizeHelper.height! * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    "assets/icons/starbuckLogo.png",
                  ),
                )),
                child: _riveArtboard != null
                    ? Rive(artboard: _riveArtboard!)
                    : SizedBox(),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: Container(
                  width: sizeHelper.width! * 0.5,
                  height: sizeHelper.height! * 0.45,
                  //color: Colors.amber,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Boy seçimi",
                        style: labelTextStyle,
                      ),
                      FormBuilderChoiceChip(
                        initialValue: "Grande",
                        name: "size",
                        selectedColor: Color(0XFFEAC784),
                        selectedShadowColor: Colors.white,
                        backgroundColor: Colors.white,
                        labelStyle: GoogleFonts.roboto(color: Colors.black),
                        spacing: 5,
                        options: [
                          FormBuilderFieldOption(value: "Tall"),
                          FormBuilderFieldOption(value: "Grande"),
                          FormBuilderFieldOption(value: "Venti"),
                        ],
                        onChanged: (changed) {
                          if (changed == "Venti") {
                            _typeInput?.value = 2;
                            ventiTrigger?.fire();
                          }
                          if (changed == "Grande") {
                            _typeInput?.value = 1;
                            grandeTrigger?.fire();
                          }
                          if (changed == "Tall") {
                            _typeInput?.value = 0;
                            tallTrigger?.fire();
                          }
                        },
                      ),
                      Text(
                        "Süt Tercihiniz",
                        style: labelTextStyle,
                      ),
                      FormBuilderChoiceChip(
                        initialValue: "Tam Yağlı",
                        name: "milk",
                        selectedColor: Color(0XFFEAC784),
                        selectedShadowColor: Colors.white,
                        backgroundColor: Colors.white,
                        labelStyle: GoogleFonts.roboto(color: Colors.black),
                        spacing: 5,
                        options: [
                          FormBuilderFieldOption(value: "Yağsız Süt"),
                          FormBuilderFieldOption(value: "Soya Sütü"),
                          FormBuilderFieldOption(value: "Tam Yağlı"),
                          FormBuilderFieldOption(value: "Badem Sütü"),
                        ],
                        onChanged: (changed) {
                          if (changed == "Kremalı") {
                            creamTrigger?.fire();
                          }
                        },
                      ),
                      Text(
                        "Krema Tercihiniz",
                        style: labelTextStyle,
                      ),
                      FormBuilderChoiceChip(
                        initialValue: "Kremasız",
                        name: "cream",
                        selectedColor: Color(0XFFEAC784),
                        selectedShadowColor: Colors.white,
                        backgroundColor: Colors.white,
                        labelStyle: GoogleFonts.roboto(color: Colors.black),
                        spacing: 5,
                        options: [
                          FormBuilderFieldOption(value: "Kremalı"),
                          FormBuilderFieldOption(value: "Kremasız"),
                        ],
                        onChanged: (changed) {
                          if (changed == "Kremalı") {
                            creamTrigger?.fire();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: sizeHelper.height! * 0.5,
              child: Container(
                width: sizeHelper.width,
                height: sizeHelper.height! * 0.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ekstra Özelleştirmeler",
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ek Parçacık",
                        style: labelTextStyle,
                      ),
                      FormBuilderChoiceChip(
                        name: "drizzle",
                        selectedColor: Color(0XFFEAC784),
                        selectedShadowColor: Colors.white,
                        backgroundColor: Colors.white,
                        labelStyle: GoogleFonts.roboto(color: Colors.black),
                        spacing: 5,
                        options: [
                          FormBuilderFieldOption(value: "Caramel Drizzle"),
                          FormBuilderFieldOption(value: "Strawberry Drizzle"),
                          FormBuilderFieldOption(value: "Mocha Drizzle"),
                        ],
                        onChanged: (changed) {
                          chocolateTrigger?.fire();
                        },
                      ),
                      Text(
                        "Şurup",
                        style: labelTextStyle,
                      ),
                      FormBuilderChoiceChip(
                        name: "syrup",
                        alignment: WrapAlignment.center,
                        selectedColor: Color(0XFFEAC784),
                        selectedShadowColor: Colors.white,
                        backgroundColor: Colors.white,
                        labelStyle: GoogleFonts.roboto(color: Colors.black),
                        spacing: 5,
                        options: [
                          FormBuilderFieldOption(value: "Badem"),
                          FormBuilderFieldOption(value: "Vanilya"),
                          FormBuilderFieldOption(value: "Ahududu"),
                          FormBuilderFieldOption(value: "Nane"),
                          FormBuilderFieldOption(value: "Karamel"),
                          FormBuilderFieldOption(value: "Fındık"),
                          FormBuilderFieldOption(value: "Irish Cream"),
                        ],
                        onChanged: (changed) {
                          syrupTrigger?.fire();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
