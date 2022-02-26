import 'package:flutter/material.dart';
import 'package:starbucks_concept/helpers/sizeHelper.dart';
import 'package:starbucks_concept/pages/loginPage.dart';
import 'package:starbucks_concept/pages/navigationPage.dart';

class LandPage extends StatefulWidget {
  const LandPage({Key? key}) : super(key: key);

  @override
  _LandPageState createState() => _LandPageState();
}

class _LandPageState extends State<LandPage> {
  bool isLogged = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper(fetchedContext: context);
    return isLogged ? const NavigationPage() : const LoginPage();
  }
}
