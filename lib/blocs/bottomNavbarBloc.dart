import 'dart:async';

enum NavBarItem { Easy, Medium, Hard, Profile }

class BottomNavBarBloc {
  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.Easy;

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void pickItem(int i) {
    switch (i) {
      case 0:
        _navBarController.sink.add(NavBarItem.Easy);
        break;

      case 1:
        _navBarController.sink.add(NavBarItem.Medium);
        break;
      case 2:
        _navBarController.sink.add(NavBarItem.Hard);
        break;
      case 3:
        _navBarController.sink.add(NavBarItem.Profile);
        break;
    }
  }

  close() {
    _navBarController.close();
  }
}
