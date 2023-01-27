import 'package:clubs/componant/componant.dart';
import 'package:clubs/componant/style.dart';
import 'package:clubs/cubit/Home_state.dart';
import 'package:clubs/cubit/home_cubit.dart';
import 'package:clubs/moduel/admin/admin_screen.dart';
import 'package:clubs/moduel/home/category_feed.dart';
import 'package:clubs/moduel/home/get_category.dart';
import 'package:clubs/moduel/home/get_feeds.dart';
import 'package:clubs/moduel/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          var h = MediaQuery.of(context).size.height;
          var w = MediaQuery.of(context).size.width;
          return Scaffold(
            body:  SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: h * .05,
                                left: w * .02,
                                right: w * .02,
                                bottom: h * .01),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'images/lab.png',
                                      height: h * .05,
                                      width: w * .3,
                                    ),
                                    defaultText(
                                        txt: 'Faculty of science',
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                  ],
                                ),
                             
                                Spacer(),
                                if (cubit.isAdmin == true)
                                  InkWell(
                                      onTap: () {
                                        nextPage(
                                            context: context, page: Admin());
                                      },
                                      child: Icon(
                                        Icons.add_box,
                                        color: mainColor,
                                      )),
                                SizedBox(
                                  width: w * .06
                                ),
                               
                                InkWell(
                                  onTap: () {
                                    cubit.logOut();
                                    nextPageUntil(
                                        context: context, page: Login());
                                  },
                                  child: Row(
                                    children: [
                                       defaultText(
                                    txt: 'logout',
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: greyColor),
                                      Icon(
                                        Icons.logout_outlined,
                                        color: greyColor,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: EdgeInsets.only(
                                left: w * .02, right: w * .02, bottom: h * .03),
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              child: cubit.clubs.isNotEmpty
                                  ? ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          getCategory(
                                              cubit.clubs[index], context),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            width: 12,
                                          ),
                                      itemCount: cubit.clubs.length)
                                  : Center(child: CupertinoActivityIndicator()),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: h * .8,
                              width: double.infinity,
                              child: cubit.events.isNotEmpty
                                  ? ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          getFeeds(cubit.events[index]),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        height: h * .006,
                                      ),
                                      itemCount: cubit.events.length,
                                      shrinkWrap: true,
                                    )
                                  : Center(child: CircularProgressIndicator()),
                            ),
                          )
                        ]),
                  )
                ,
          );
        });
  }
}
