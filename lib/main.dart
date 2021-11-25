import 'dart:async';
//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ota_update/ota_update.dart';
import 'package:get/get.dart';
import 'package:motion/pages/freeClass.dart';
import 'package:motion/pages/login.dart';
//import 'package:motion/bottomTabs/me.dart';
import 'package:motion/bottomTabs/archive.dart';
import 'package:motion/misc/purchaseApi.dart';
import 'package:motion/hardcore.dart';
import 'package:motion/state/videoMobile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:intl/intl.dart';

main() async {
  // final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  await Firebase.initializeApp();
  DateTime now = new DateTime.now();
  print(DateFormat('d').format(DateTime.now()));
  DateTime date = new DateTime(now.year);
  print(date);
  Wakelock.enable();
  await PurchaseApi.init();
  await PurchaseApi.fetchOffers();
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
        GetPage(name: '/freeClass', page: () => FreeClass()),
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
