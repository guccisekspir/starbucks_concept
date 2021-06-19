import 'package:starbucks_concept/pages/models/tags.dart';

class Drink {
  final String name;
  final String description;
  final String photoURL;
  final int typeID;
  final List<Tag> tags;

  Drink(this.name, this.description, this.photoURL, this.typeID, this.tags);
}
