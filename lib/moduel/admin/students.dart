import 'package:clubs/componant/componant.dart';
import 'package:clubs/componant/style.dart';
import 'package:clubs/cubit/Home_state.dart';
import 'package:clubs/cubit/home_cubit.dart';
import 'package:clubs/moduel/admin/add_student.dart';
import 'package:clubs/moduel/admin/create_event.dart';
import 'package:clubs/moduel/admin/get_clubs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Students extends StatelessWidget {
  const Students({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          var h = MediaQuery.of(context).size.height;
          var w = MediaQuery.of(context).size.width;
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: h * .05, left: w * .05, bottom: h * .01),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                            )),
                        SizedBox(
                          width: w * .2,
                        ),
                        defaultText(
                          txt: 'Add Student',
                          color: mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: h - 100,
                    child: cubit.clubs.isNotEmpty
                        ? ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  nextPage(
                                      context: context,
                                      page: AddStudent(
                                        name: cubit.clubs[index].title,
                                        image: cubit.clubs[index].image,
                                      ));
                                },
                                child: getClubs(cubit.clubs[index])),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: h * .012,
                                ),
                            itemCount: cubit.clubs.length)
                        : Center(child: CupertinoActivityIndicator()),
                  )
                ],
              ),
            ),
          );
        });
  }
}
