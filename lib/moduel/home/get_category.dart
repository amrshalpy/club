import 'package:clubs/componant/componant.dart';
import 'package:clubs/cubit/home_cubit.dart';
import 'package:clubs/model/club.dart';
import 'package:clubs/moduel/home/category_feed.dart';
import 'package:flutter/material.dart';

Widget getCategory(ClubModel eventShow, context) {
  return InkWell(
    onTap: () {
      HomeCubit.get(context).getEventClub(name: eventShow.title);
      nextPage(
          context: context,
          page: CategoryFeeds(
            name: eventShow.title,
          ));
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: .3)),
      height: 70,
      width: 100,
      child: Center(
        child: Column(
          children: [
            eventShow.image == null
                ? Image.asset('images/icons8-american-football-player-48.png')
                : Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      height: 60,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: .3),
                          image: DecorationImage(
                              image: NetworkImage('${eventShow.image}'),
                              fit: BoxFit.cover)),
                    ),
                  ),
            defaultText(
                txt: '${eventShow.title}',
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold)
          ],
        ),
      ),
    ),
  );
}
