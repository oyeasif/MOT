import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleWidget extends StatelessWidget {
  final title;
  double size;
  final weight;
  final color;
  final decoration;
  final textAlign;

  TextStyleWidget({Key? key, required this.title, required this.size, this.weight, this.color, this.decoration, this.textAlign, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title, style: GoogleFonts.poppins(fontWeight: weight, color: color, fontSize: size,fontStyle: FontStyle.normal,decoration: decoration),textAlign: textAlign,);
  }
}
