import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponent {

  static Text title(String text) {
    return Text(text, style: GoogleFonts.notoSansJp(fontSize: 24, fontWeight: FontWeight.bold));
  }

  static Text subtitle(String text) {
    return Text(text, style: GoogleFonts.notoSansJp(fontSize: 16, fontWeight: FontWeight.normal));
  }
}