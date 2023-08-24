import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class algeriya_text extends StatelessWidget {
  algeriya_text({
    required this.containt,
    this.fontsize = 20,
    this.fontWeight = FontWeight.bold,
    Key? key}) : super(key: key);

  final String containt;
  double fontsize;
  FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(containt,
      style: GoogleFonts.alegreya(
        fontSize: fontsize.spMin,
        fontWeight: fontWeight,
      ),
    );
  }
}
