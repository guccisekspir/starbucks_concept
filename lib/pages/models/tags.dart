import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tag {
  final String name;
  final Color tagColor;
  final double widthSize;
  final double heightSize;
  final Image tagIcon;

  Tag(this.name, this.tagColor, this.tagIcon, this.heightSize, this.widthSize);

  Widget getTagWidget() {
    return Container(
      height: heightSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.withOpacity(0.5),
          border: Border.all(color: Colors.lightGreen)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 3,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            this.name + "  ",
            style: GoogleFonts.lilitaOne(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
