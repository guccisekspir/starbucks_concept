import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:starbucks_concept/blocs/bottomNavbarBloc.dart';
import 'package:starbucks_concept/pages/navBarPages/homePage.dart';
import 'package:starbucks_concept/pages/navBarPages/orderPage.dart';
import 'package:starbucks_concept/pages/navBarPages/profilePage.dart';
import 'package:starbucks_concept/pages/navBarPages/feedPage.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late BottomNavBarBloc _bottomNavBarBloc;

  bool isConnected = true;

  int bottomNavBarIndex = 0;

  //TODO user gelmeme durumunda sharedPref bak yoksa oturumdan çıkış yap tekrar girmesini iste
  //

  @override
  void initState() {
    // TODO: implement initState
    _bottomNavBarBloc = BottomNavBarBloc();

    super.initState();
  }

  @override
  void dispose() {
    _bottomNavBarBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      //Safe areada ne gözükmesini istiyorsan onu yapmak gerekiyor
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        //bloc yapımızı seçimlerden haberdar etmek
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder:
            // ignore: missing_return
            (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data!) {
              case NavBarItem.Easy:
                return const HomePage();
              case NavBarItem.Medium:
                return const OrderPage();
              case NavBarItem.Hard:
                return const FeedPage();
              case NavBarItem.Profile:
                return const ProfilePage();
            }
          }
          return Container();
        },
      ),
      bottomNavigationBar: StreamBuilder(
          //blocdaki streami dinlemek
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          builder: (context, snapshot) {
            return AnimatedBottomNavigationBar.builder(
              backgroundColor: Colors.white,
              splashColor: Colors.green,
              activeIndex: bottomNavBarIndex,
              gapLocation: GapLocation.none,

              notchSmoothness: NotchSmoothness.softEdge,
              onTap: (index) => setState(() => {_bottomNavBarBloc.pickItem(index), bottomNavBarIndex = index}),
              itemCount: 4,
              tabBuilder: (int index, bool isActive) {
                final color = isActive ? Colors.green : Colors.grey;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      iconList[index],
                      size: 24,
                      color: color,
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: AutoSizeText(
                        navbarString[index],
                        maxLines: 1,
                        style: GoogleFonts.lilitaOne(color: color),
                      ),
                    )
                  ],
                );
              },
              //other params
            );
          }),
    );
  }

  List<IconData> iconList = [LineIcons.home, LineIcons.mugHot, LineIcons.shoppingBasket, LineIcons.userAstronaut];

  List<String> navbarString = ["Ana Sayfa", "Siparis", "Kesfet", "Profil"];
}
