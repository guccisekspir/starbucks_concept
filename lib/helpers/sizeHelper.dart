import 'package:flutter/material.dart';

class SizeHelper {
  BuildContext? ccontext;
  double? width;
  double? height;

  static final SizeHelper _sizeHelper = SizeHelper._internal();

  SizeHelper._internal();

  factory SizeHelper({BuildContext? fetchedContext}) {
    //LnadPage'de context'i verdiğimiz için sonraki yerlerde
    //tekrar tekrar çağırmamak için bunu yapıyoruz
    if (fetchedContext != null) _sizeHelper.ccontext = fetchedContext;
    if (_sizeHelper.width == null && _sizeHelper.height == null) {
      _sizeHelper.width = MediaQuery.of(_sizeHelper.ccontext!).size.width;
      _sizeHelper.height = MediaQuery.of(_sizeHelper.ccontext!).size.height;
    }
    return _sizeHelper;
  }
}
