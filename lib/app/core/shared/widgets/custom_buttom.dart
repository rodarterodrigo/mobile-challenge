import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_challenge/app/core/shared/widgets/enums/button_style.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {@required this.onPressed,
        @required this.text,
        this.buttonStyle = CustomButtonStyle.Primary});

  final GestureTapCallback onPressed;
  final String text;
  final CustomButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    switch (buttonStyle) {
      case CustomButtonStyle.Primary:
        return MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(2.5)),
            padding: EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 10),
            color: Theme.of(context).accentColor,
            textColor: Colors.black87,
            child: new Text(text, style: getButtonFontStyle(buttonStyle, context)),
            onPressed: onPressed);
        break;
      case CustomButtonStyle.Secondary:
        return MaterialButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 1,
                    style: BorderStyle.solid),
                borderRadius: new BorderRadius.circular(2.5)),
            padding: EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 10),
            color: Theme.of(context).primaryColor,
            textColor: Colors.black87,
            child: new Text(text, style: getButtonFontStyle(buttonStyle, context)),
            onPressed: onPressed);
        break;
    }
  }

  TextStyle getButtonFontStyle(CustomButtonStyle buttonStyle, BuildContext context) {
    switch (buttonStyle) {
      case CustomButtonStyle.Primary:
        return GoogleFonts.poppins(
            fontSize: 16, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500);
        break;
      case CustomButtonStyle.Secondary:
        return GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500);
        break;
      default:
        return GoogleFonts.poppins(fontSize: 13, color: Colors.white);
        break;
    }
  }
}