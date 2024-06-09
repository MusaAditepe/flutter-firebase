import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hbos/services/user_services.dart';
import 'package:hbos/views/auth/intro_view.dart';
import 'package:hbos/views/home/home_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    UserServices userServices = UserServices();
    var userModel =
        await userServices.getUser(FirebaseAuth.instance.currentUser!.uid);
    if (userModel != null) {
      userModel.lastLoginDate = DateTime.now();
      userServices.updateUser(userModel);
    }

    if (userModel == null) user = null;
  }

  runApp(MyApp(
    hasCurrentUser: user != null,
  ));
}

class MyApp extends StatelessWidget {
  final bool hasCurrentUser;

  const MyApp({super.key, required this.hasCurrentUser});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kanca',
      theme: ThemeData(
        fontFamily: "muli",
        colorScheme: const ColorScheme.light(),
      ),
      home: hasCurrentUser ? const HomeView() : const IntroView(),
    );
  }
}
