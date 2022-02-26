import 'package:flutter/material.dart';
import 'package:starbucks_concept/pages/models/drink.dart';
import 'package:starbucks_concept/pages/models/tags.dart';

double height = 20;
double width = 100;

List<Tag> tags = [
  Tag("Sert", Colors.amber, Image.asset("assets/icons/coffee-beans.png"), height, width),
  Tag("Baharatlı", Colors.redAccent, Image.asset("assets/icons/pepper.png"), height, width),
  Tag("Enerjik", Colors.cyanAccent, Image.asset("assets/icons/lightning-bolt.png"), height, width),
  Tag("Eglenceli", Colors.deepOrangeAccent, Image.asset("assets/icons/clown.png"), height, width),
  Tag("Tatlı", Colors.pinkAccent, Image.asset("assets/icons/candy.png"), height, width),
  Tag("Yumusak", Colors.indigoAccent, Image.asset("assets/icons/feather.png"), height, width),
  Tag("Popüler", Colors.deepPurpleAccent, Image.asset("assets/icons/wildfire.png"), height, width),
];

List<Drink> lattesDrinks = [
  Drink(
      "Gingerbread Latte",
      "Tatlı ve zarif baharatlı zencefilli kurabiye lezzetleri, klasik espressomuz ve buğulanmış sütümüzle birleşir ve mükemmel bir tatil dokunuşu için çırpılmış krema ve öğütülmüş hindistan cevizi ile doldurulur.",
      "assets/latte/gingerbread-latte.png",
      1,
      [tags[1], tags[2], tags[6]]),
  Drink(
      "Salted Caramel Latte",
      "Espresso, tuzlu karamel sos ve sütün lezzetli buluşmasının krema ve karamel sos ile tamamlanması ile hazırlanıyor.",
      "assets/latte/salted-caramel-latte.png",
      1,
      [tags[4], tags[5], tags[2]]),
  Drink(
      "Blonde Latte",
      "Ekstra pürüzsüz Starbucks® Blonde Espresso, kadifemsi buğulanmış süt ve vanilya şurubu, sevilen bir espresso klasiğine yeni ve keyifli bir dokunuş yaratmak için bir araya geliyor. Daha hafif kavrulmuş kahve tercih edenler için ideal bir fincan.",
      "assets/latte/blonde-latte.png",
      1,
      [tags[3], tags[2], tags[4]]),
  Drink(
      "Cafe Latte",
      "Buğulanmış süt ve hafif bir köpük tabakası ile dengelenmiş koyu, zengin espressomuz. Mükemmel bir süt ileri ısınma.",
      "assets/latte/caffe-latte.png",
      1,
      [tags[3], tags[2], tags[6]]),
  Drink(
      "Toffeenut Latte",
      "Tatlı ve zarif baharatlı zencefilli kurabiye lezzetleri, klasik espressomuz ve buğulanmış sütümüzle birleşir ve mükemmel bir tatil dokunuşu için çırpılmış krema ve öğütülmüş hindistan cevizi ile doldurulur.",
      "assets/latte/toffeenut-latte.png",
      1,
      [tags[4], tags[2], tags[3]]),
];

List<Drink> mochasDrinks = [
  Drink(
      "Caffe Mocha",
      "Acı tatlı moka sosu ve buğulanmış süt ile birleştirilen zengin, tam gövdeli espressomuz, ardından tatlandırılmış krem şanti ile doldurulur. Her zaman tatlı bir şekilde tatmin eden klasik kahve içeceği.",
      "assets/mochas/caffe-mocha.png",
      1,
      [tags[3], tags[2], tags[4]]),
  Drink(
      "White Chocolate Mocha",
      "Özel espressomuz beyaz çikolata sosu ve buğulanmış sütle buluşuyor ve ardından bu üstün beyaz çikolata lezzetini yaratmak için şekerli çırpılmış krema ile tamamlanıyor.",
      "assets/mochas/White_Chocolate_Mocha.png",
      1,
      [tags[4], tags[2], tags[3]]),
];

List<Drink> macchiatoDrinks = [
  Drink(
      "Caramel Macchiato",
      "Vanilya aromalı şuruplu taze buharda pişirilmiş süt, espresso ile işaretlenmiş ve çok tatlı bir son için karamel serpiştirilmiş.",
      "assets/macchiato/caramel-macchiato.png",
      1,
      [tags[3], tags[2], tags[4]]),
  Drink(
      "Caramel Cloud Macchiato",
      "Cloud Macchiato'muz, kabarık köpük katmanları, basamaklı espresso, vanilya aromalı şurup ve bir çiseleyen karamel ile hafif ve havadardır. Macchiato'nuzu sevmenin yepyeni bir yolu.",
      "assets/macchiato/caramel-cloud-macchiato.png",
      1,
      [tags[1], tags[5], tags[6]]),
  Drink(
      "Latte Macchiato",
      "Bu espresso klasiği, yudumlamanın yeni ve cesur bir yolu için hafifçe havalandırılmış sütün üzerine yavaşça dökülen espresso çekimlerine sahiptir.",
      "assets/macchiato/latte-macchiato.png",
      1,
      [tags[0], tags[3], tags[1]]),
];

List<Drink> espressoDrinks = [
  Drink(
      "Espresso",
      "Zengin lezzet ve karamel tatlılığına sahip pürüzsüz imza Espresso Roast'ımız, yaptığımız her şeyin tam kalbinde yer almaktadır.",
      "assets/espresso/espresso.png",
      1,
      [tags[1], tags[2], tags[3]]),
  Drink(
      "Espresso Con Panna",
      "Espresso, düz bir atışın zengin ve karamelli lezzetlerini geliştirmek için bir parça çırpılmış krema ile buluşuyor.",
      "assets/espresso/espresso-con-panna.png",
      1,
      [tags[4], tags[6], tags[5]]),
  Drink("Espresso Macchiato", "Buğulanmış süt ve köpük dolgulu zengin espressomuz. Avrupa tarzı bir klasik.",
      "assets/espresso/espresso-macchiato.png", 1, [tags[2], tags[3], tags[5]]),
];

List<Drink> icedLattesDrinks = [
  Drink(
      "Buzlu Gingerbread Latte",
      "Tatlı ve zarif baharatlı zencefilli kurabiye lezzetleri, klasik espressomuz ve buğulanmış sütümüzle birleşir ve mükemmel bir tatil dokunuşu için çırpılmış krema ve öğütülmüş hindistan cevizi ile doldurulur.",
      "assets/latte/iced-gingerbread-latte.png",
      1,
      [tags[1], tags[2], tags[6]]),
  Drink(
      "Buzlu Salted Caramel Latte",
      "Espresso, tuzlu karamel sos ve sütün lezzetli buluşmasının krema ve karamel sos ile tamamlanması ile hazırlanıyor.",
      "assets/latte/buzlu-salted-caramel-latte.png",
      1,
      [tags[4], tags[5], tags[2]]),
  Drink(
      "Buzlu Cafe Latte",
      "Buğulanmış süt ve hafif bir köpük tabakası ile dengelenmiş koyu, zengin espressomuz. Mükemmel bir süt ileri ısınma.",
      "assets/latte/iced-caffe-latte.png",
      1,
      [tags[3], tags[2], tags[6]]),
  Drink(
      "Buzlu Toffeenut Latte",
      "Tatlı ve zarif baharatlı zencefilli kurabiye lezzetleri, klasik espressomuz ve buğulanmış sütümüzle birleşir ve mükemmel bir tatil dokunuşu için çırpılmış krema ve öğütülmüş hindistan cevizi ile doldurulur.",
      "assets/latte/iced-toffeenut-latte.png",
      1,
      [tags[4], tags[2], tags[3]]),
];

List<Drink> icedMochasDrinks = [
  Drink(
      "Buzlu Caffe Mocha",
      "Acı tatlı moka sosu ve buğulanmış süt ile birleştirilen zengin, tam gövdeli espressomuz, ardından tatlandırılmış krem şanti ile doldurulur. Her zaman tatlı bir şekilde tatmin eden klasik kahve içeceği.",
      "assets/mochas/iced-caffe-mocha.png",
      1,
      [tags[3], tags[2], tags[4]]),
  Drink(
      "Buzlu White Chocolate Mocha",
      "Özel espressomuz beyaz çikolata sosu ve buğulanmış sütle buluşuyor ve ardından bu üstün beyaz çikolata lezzetini yaratmak için şekerli çırpılmış krema ile tamamlanıyor.",
      "assets/mochas/Buzlu_White_Chocolate_Mocha.png",
      1,
      [tags[4], tags[2], tags[3]]),
];

List<Drink> icedMacchiatoDrinks = [
  Drink(
      "Buzlu Caramel Macchiato",
      "Vanilya aromalı şuruplu taze buharda pişirilmiş süt, espresso ile işaretlenmiş ve çok tatlı bir son için karamel serpiştirilmiş.",
      "assets/macchiato/buzlu-caramel-macchiato.png",
      1,
      [tags[3], tags[2], tags[4]]),
];
