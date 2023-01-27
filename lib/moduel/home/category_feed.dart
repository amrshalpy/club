import 'package:clubs/componant/componant.dart';
import 'package:clubs/componant/style.dart';
import 'package:clubs/cubit/Home_state.dart';
import 'package:clubs/cubit/home_cubit.dart';
import 'package:clubs/moduel/home/get_category_feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryFeeds extends StatefulWidget {
  String? name;
  CategoryFeeds({Key? key, this.name}) : super(key: key);

  @override
  State<CategoryFeeds> createState() => _CategoryFeedsState();
}

class _CategoryFeedsState extends State<CategoryFeeds> {
  bool isStudent = false;
  bool isEvent = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getEventClub(name: widget.name)
        ..getAllUserInClub(name: widget.name),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            HomeCubit cubit = HomeCubit.get(context);
            var h = MediaQuery.of(context).size.height;
            var w = MediaQuery.of(context).size.width;
            return Scaffold(
              body: SingleChildScrollView(
                child: cubit.eventShow != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: h,
                          width: double.infinity,
                          child: Column(children: [
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.arrow_back)),
                                  SizedBox(
                                    width: h * .06,
                                  ),
                                  defaultText(
                                      txt: 'Events',
                                      color: mainColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h * .02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: h * .05,
                                  width: w * .3,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: mainColor),
                                      onPressed: () {
                                        setState(() {
                                          isStudent = false;
                                          isEvent = true;
                                        });
                                      },
                                      child: defaultText(
                                        txt: 'Events',
                                        color: Colors.white,
                                      )),
                                ),
                                SizedBox(
                                  width: w * .13,
                                ),
                                Container(
                                  height: h * .05,
                                  width: w * .3,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: mainColor),
                                      onPressed: () {
                                        setState(() {
                                          isStudent = true;
                                          isEvent = false;
                                        });
                                      },
                                      child: defaultText(
                                        txt: 'Students',
                                        color: Colors.white,
                                      )),
                                )
                              ],
                            ),
                            if (isEvent == true)
                              cubit.eventShow.isNotEmpty
                                  ? Container(
                                      height: h * .4,
                                      width: double.infinity,
                                      child: ListView.separated(
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              getCategoryFeed(
                                                  cubit.eventShow[index]),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                height: 20,
                                              ),
                                          itemCount: cubit.eventShow.length),
                                    )
                                  : Center(child: CupertinoActivityIndicator()),
                            if (isStudent == true)
                              cubit.usersClub.isNotEmpty
                                  ? Container(
                                      height: h * .4,
                                      width: double.infinity,
                                      child: ListView.separated(
                                          itemBuilder: (context, index) =>
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  child: Center(
                                                      child: defaultText(
                                                          txt:
                                                              '${cubit.usersClub[index].name}',
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                                  height: h * .07,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      border:
                                                          Border.all(width: .4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                ),
                                              ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(),
                                          itemCount: cubit.usersClub.length),
                                    )
                                  : Center(child: CupertinoActivityIndicator())
                          ]),
                        ),
                      )
                    : Center(child: CupertinoActivityIndicator()),
              ),
            );
          }),
    );
  }
}
