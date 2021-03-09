import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final baseUrl="https://newsapi.org/v2/everything?q=apple&from=2021-03-07&to=2021-03-07&sortBy=popularity&apiKey=7f280a4a7ffc461895416294423c4c53";
final appBarColor=Colors.cyan;
final lightBlue=Colors.lightBlue[200];
final colorBlue=Colors.blue;
final colorBlack=Colors.black;


/// Set text style

text_Style(Color color, double size,FontWeight fontWeight){
  return GoogleFonts.roboto(
    color: color,
    fontSize: size,
    fontWeight:fontWeight,

  );}


Text drawerTextStyle(String title, Color color, {double fontSize}) {
  return Text(
    title,
    style: GoogleFonts.roboto(
        color: color, fontWeight: FontWeight.w500, fontSize: fontSize),
  );
}