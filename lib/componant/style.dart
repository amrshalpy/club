import 'package:flutter/material.dart';

Color mainColor = Color(0xffE3900E);
Color secandColor = Color(0xffe49366);
Color greyColor = Color(0xffcfb5a6);
Widget crdientColor() {
  return Container(
      decoration: BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [secandColor, mainColor])),
      ));
}
