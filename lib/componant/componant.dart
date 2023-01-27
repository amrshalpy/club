import 'package:flutter/material.dart';

nextPage({
  context,
  Widget? page,
}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page!));
}

nextPageUntil({
  context,
  Widget? page,
}) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => page!), (route) => false);
}

defaultText({
  String? txt,
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
}) {
  return Text(
    txt!,
    style: TextStyle(
      color: color,
      fontFamily: 'Montserrat',
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

buildTextField({
  context,
  TextEditingController? controller,
  String? hint,
  String? label,
  Color color = Colors.white,
  IconData? icon,
  Function? validate,
  Function? changed,
  IconData? suffixIcon,
  bool obscure = false,
  double width = double.infinity,
  TextInputType? type,
  Function()? press,
  Function()? ontap,
}) {
  var h = MediaQuery.of(context).size.height;
  var w = MediaQuery.of(context).size.width;
  return Container(
    height: h * .055,
    width: w * .82,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        border: Border.all(color: Colors.black, width: .4)),
    child: TextFormField(
      validator: (value) => validate!(value),
      onChanged: (value) => changed!(value),
      cursorColor: Colors.black,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10),
        hintText: hint,
        border: InputBorder.none,
      ),
    ),
  );
}
