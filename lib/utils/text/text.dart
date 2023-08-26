import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class algeriya_text extends StatelessWidget {
  algeriya_text({
    required this.containt,
    this.fontsize = 20,
    this.fontWeight = FontWeight.bold,
    this.fontcolor = Colors.black,
    Key? key}) : super(key: key);

  final String containt;
  double fontsize;
  FontWeight fontWeight;
  Color fontcolor;

  @override
  Widget build(BuildContext context) {
    var fontcolorbybrightness = Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white;
    return Text(containt,
      style: GoogleFonts.alegreya(
        fontSize: fontsize.spMin,
        fontWeight: fontWeight,
        color: fontcolor == null ? fontcolorbybrightness : fontcolor,
      ),
    );
  }
}



class cario_text extends StatelessWidget {
  cario_text({
    required this.containt,
    this.fontsize = 20,
    this.fontWeight = FontWeight.bold,
    this.fontcolor = Colors.black,
    Key? key}) : super(key: key);

  final String containt;
  double fontsize;
  FontWeight fontWeight;
  Color fontcolor;

  @override
  Widget build(BuildContext context) {
    var fontcolorbybrightness = Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white;
    return Text(containt,
      style: GoogleFonts.cairo(
        fontSize: fontsize.spMin,
        fontWeight: fontWeight,
        color: fontcolor == null ? fontcolorbybrightness : fontcolor,
      ),
    );
  }
}

