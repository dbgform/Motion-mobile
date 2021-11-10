import 'dart:async';
//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ota_update/ota_update.dart';
import 'package:get/get.dart';
import 'package:motion/pages/login.dart';
//import 'package:motion/bottomTabs/me.dart';
import 'package:motion/bottomTabs/archive.dart';
import 'package:motion/hardcore.dart';
import 'package:motion/state/videoMobile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  // final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  await Firebase.initializeApp();

  await getClasses();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.notoSans().fontFamily),
      home: ArchiveStateful(),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/', page: () => ArchiveStateful()),
        //   GetPage(name: '/ride', page: () => VideoAppState()),
        GetPage(name: '/login', page: () => LoginPage()),
        //  GetPage(name: '/loginV', page: () => LoginPageVertical()),
//GetPage(name: '/justride', page: () => FreeRideApp()),
        GetPage(name: '/videoMobile', page: () => VideoAppMobile()),

        // GetPage(name: '/1', page: () => HomePage())
      ],
    ),
    //create: (context) => StateManager(),
  );
}
