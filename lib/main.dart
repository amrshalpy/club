import 'package:clubs/componant/const.dart';
import 'package:clubs/cubit/home_cubit.dart';
import 'package:clubs/moduel/home/home.dart';
import 'package:clubs/moduel/login/login.dart';
import 'package:clubs/moduel/splash_screen.dart/splash_screen.dart';
import 'package:clubs/share/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  uid = CacheHelper.getShared(key: kUid) != null
      ? CacheHelper.getShared(key: kUid)
      : null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()
      ..getIsAdmin()
      ..getClub()
      ..getEvents()
      ..getAllUser()
      ..getAllUserInClub()
      
      )],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
