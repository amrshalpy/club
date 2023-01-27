import 'package:clubs/componant/componant.dart';
import 'package:clubs/model/club.dart';
import 'package:flutter/material.dart';

Widget getClubs(ClubModel club) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), border: Border.all()),
      height: 70,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            club.image == null
                ? Image.asset(
                    'images/icons8-american-football-player-48.png',
                    height: 60,
                    width: 70,
                  )
                : Image.network(
                    '${club.image}',
                    height: 60,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
            SizedBox(
              width: 30,
            ),
            defaultText(
                txt: club.title,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            Spacer(),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    ),
  );
}
