import 'package:clubs/componant/componant.dart';
import 'package:clubs/componant/style.dart';
import 'package:clubs/cubit/Home_state.dart';
import 'package:clubs/cubit/home_cubit.dart';
import 'package:clubs/moduel/admin/create_club.dart';
import 'package:clubs/moduel/admin/create_event.dart';
import 'package:clubs/moduel/admin/event.dart';
import 'package:clubs/moduel/admin/students.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Admin extends StatelessWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          var h = MediaQuery.of(context).size.height;
          var w = MediaQuery.of(context).size.width;
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: h * .08, left: w * .05),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                      SizedBox(
                        width: w * .15,
                      ),
                      defaultText(
                          txt: 'Admin Pannel',
                          color: mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)
                    ],
                  ),
                ),
                 SizedBox(height: h*.05,),
                  Center(
                         child: Column(
                                    children: [
                                      Image.asset(
                                        'images/lab.png',
                                        height: h * .07,
                                        width: w * .4,
                                      ),
                                      SizedBox(height: h*.005,),
                                      defaultText(
                                          txt: 'Faculty of science',
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ],
                                  ),
                       ),
                    //  SizedBox(height: h*.02,),    
                Padding(
                  padding: EdgeInsets.only(
                    top: h * .16,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: h * .05,
                            width: w * .5,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: mainColor),
                                onPressed: () {
                                  nextPage(
                                      context: context, page: CreateClub());
                                },
                                child: defaultText(
                                    txt: 'Create Club',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                          height: h * .04,
                        ),
                        Container(
                          height: h * .05,
                          width: w * .5,
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: mainColor),
                              onPressed: () {
                                nextPage(context: context, page: Events());
                              },
                              child: defaultText(
                                  txt: 'Create Event',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        )
                      ,SizedBox(
                          height: h * .04,
                        ),
                        Container(
                          height: h * .05,
                          width: w * .5,
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: mainColor),
                              onPressed: () {
                                nextPage(context: context, page: Students());
                              },
                              child: defaultText(
                                  txt: 'Add New Student',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        )
                     
                      ]),
                ),
              ],
            ),
          );
        });
  }
}
