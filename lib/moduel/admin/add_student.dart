import 'package:clubs/componant/componant.dart';
import 'package:clubs/componant/style.dart';
import 'package:clubs/cubit/Home_state.dart';
import 'package:clubs/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStudent extends StatefulWidget {
  String? name;
  String? image;
  AddStudent({Key? key, this.image, this.name}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  var nameController = TextEditingController();

  var descController = TextEditingController();
  bool isStudent = false;

  String? student;
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
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: h * .08,
                          left: w * .025,
                          right: w * .013,
                          bottom: h * .04),
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
                            width: 30,
                          ),
                          defaultText(
                              txt: 'Add New Student',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: mainColor),
                        ],
                      ),
                    ),
                    Container(
                      height: h * .2,
                      width: w * .4,
                      decoration: BoxDecoration(
                          image: widget.image == null
                              ? DecorationImage(
                                  image: AssetImage(
                                      'images/icons8-american-football-player-48.png'),
                                )
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    '${widget.image}',
                                  ),
                                ),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: h * .014,
                    ),
                    Center(
                      child: defaultText(
                          txt: '${widget.name}',
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: w * .09, top: h * .08, bottom: h * .01),
                      child: Row(
                        children: [
                          Icon(
                            Icons.text_fields,
                            color: mainColor,
                          ),
                          SizedBox(
                            width: w * .015,
                          ),
                          defaultText(
                              txt: 'Students',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)
                        ],
                      ),
                    ),
                    Container(
                      height: h * .055,
                      width: w * .75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 240, 240, 240),
                          border: Border.all(color: Colors.black, width: .4)),
                      child: TextFormField(
                        onTap: () {
                          cubit.getAllUser();
                          setState(() {
                            isStudent = true;
                          });
                        },
                        cursorColor: Color.fromARGB(255, 156, 29, 29),
                        controller: nameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: student == null
                              ? 'Select a student'
                              : '${student}',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * .06,
                    ),
                    Container(
                      height: h * .05,
                      width: w * .5,
                      child: state is SaveEventLoading
                          ? Center(child: CupertinoActivityIndicator())
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: mainColor),
                              onPressed: () {
                                cubit.saveUserInClub(
                                  name: nameController.text == ''
                                      ? student
                                      : nameController.text,
                                  clubName: widget.name,
                                );
                              },
                              child: defaultText(
                                  txt: 'Add Student',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
               if (isStudent == true)
                      cubit.allUsers != null
                          ? Padding(
                              padding:
                                  EdgeInsets.only(top: 250, left: 17, right: 17),
                              child: Container(
                                height: h * .2,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(width: .3),
                                    color: Colors.white),
                                child: cubit.allUsers.isNotEmpty
                                    ? ListView.separated(
                                        itemCount: cubit.allUsers.length,
                                        itemBuilder: (context, index) =>
                                            InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    student = cubit
                                                        .allUsers[index].name;
                                                    isStudent = false;
                                                  });
                                                },
                                                child: Center(
                                                  child: defaultText(
                                                    txt:
                                                        '${cubit.allUsers[index].name}',
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                )),
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) =>
                                            Divider(),
                                      )
                                    : Center(
                                        child: CupertinoActivityIndicator()),
                              ),
                            )
                          : Center(child: CupertinoActivityIndicator())
              ],
            ),
          ));
        });
  }
}
