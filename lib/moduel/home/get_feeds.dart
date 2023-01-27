import 'package:clubs/componant/componant.dart';
import 'package:clubs/componant/style.dart';
import 'package:clubs/model/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getFeeds(EventModel event) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      // height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(width: .4)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            defaultText(
                txt: event.title,
                color: mainColor,
                fontSize: 17,
                fontWeight: FontWeight.bold),
            Divider(indent: 50, endIndent: 10),
            SizedBox(
              height: 10,
            ),
            defaultText(
                txt: event.description,
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: 10,
            ),
            defaultText(
                txt: event.clubName,
                color: greyColor,
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ],
        ),
      ),
    ),
  );
}
