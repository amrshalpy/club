import 'package:clubs/componant/componant.dart';
import 'package:clubs/componant/style.dart';
import 'package:clubs/cubit/Home_state.dart';
import 'package:clubs/cubit/home_cubit.dart';
import 'package:clubs/moduel/home/home.dart';
import 'package:clubs/moduel/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
      if (state is RegisterSucsess) {
        nextPage(context: context, page: Login());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('register sucssefully')));
      } else if (state is LoginError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Email or password invalid')));
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: w * .04, right: w * .04, top: h * .3),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(width: .2)),
                        height: h * .97,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: h * .06, bottom: w * .06),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Image.asset(
                                  //   'images/icons8-qr-48.png',
                                  //   height: h * .04,
                                  //   width: h * .04,
                                  // ),
                                  // SizedBox(
                                  //   width: w * .013,
                                  // ),
                                  defaultText(
                                      txt: 'REGISTER',
                                      color: mainColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: w * .09,
                                  // top: h * .03,
                                  bottom: h * .01),
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.user,
                                    color: mainColor,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  defaultText(
                                      txt: 'Username',
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
                                  border: Border.all(
                                      color: Colors.black, width: .4)),
                              child: TextFormField(
                                cursorColor: Colors.black,
                                controller: nameController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  hintText: 'Enter UserName',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: w * .09, top: h * .03, bottom: h * .01),
                              child: Row(
                                children: [
                                  FaIcon(
                                    Icons.email_outlined,
                                    color: mainColor,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  defaultText(
                                      txt: 'UserEmail',
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
                                  border: Border.all(
                                      color: Colors.black, width: .4)),
                              child: TextFormField(
                                cursorColor: Colors.black,
                                controller: emailController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  hintText: 'Enter UserEmail',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: w * .09, top: h * .03, bottom: h * .01),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.lock_open,
                                    color: mainColor,
                                  ),
                                  SizedBox(
                                    width: w * .015,
                                  ),
                                  defaultText(
                                      txt: 'Password',
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
                                  border: Border.all(
                                      color: Colors.black, width: .4)),
                              child: TextFormField(
                                obscureText: HomeCubit.get(context).isShow,
                                cursorColor: Color.fromARGB(255, 156, 29, 29),
                                controller: passwordController,
                                decoration: InputDecoration(
                                  suffix: InkWell(
                                      onTap: () {
                                        HomeCubit.get(context).changePassword();
                                      },
                                      child: Icon(HomeCubit.get(context).icon)),
                                  contentPadding: EdgeInsets.only(left: 10),
                                  hintText: 'Enter Password',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h * .01,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(right: w * .08, top: h * .01),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: h * .07,
                                  width: h * .15,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: .4),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: state is RegisterLoading
                                      ? CupertinoActivityIndicator()
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                              Icon(
                                                Icons.arrow_left_outlined,
                                                color: mainColor,
                                                size: 30,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  HomeCubit.get(context)
                                                      .register(
                                                    name: nameController.text,
                                                    email: emailController.text,
                                                    password:
                                                        passwordController.text,
                                                  );
                                                },
                                                child: defaultText(
                                                    txt: 'Rigister',
                                                    color: mainColor,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
                // SizedBox(
                //   height: h * .01,
                // ),
                Padding(
                  padding: EdgeInsets.only(
                      left: w * .03, right: w * .03, bottom: h * .03),
                  child: Container(
                    height: h * .09,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: h * .001, left: w * .019, right: w * .02),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            defaultText(
                              txt: 'if you have an account !  ',
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            InkWell(
                              onTap: () {
                                nextPage(context: context, page: Login());
                              },
                              child: defaultText(
                                txt: 'Login',
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
