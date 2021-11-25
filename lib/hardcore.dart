import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:ota_update/ota_update.dart';
import 'package:package_info/package_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Hardcode {
  int id;
  String name;
  String image;
  String uri;
  String details;
  String time;
  String studio;
  Hardcode(this.id, this.name, this.image, this.uri, this.details, this.time,
      this.studio);

  Hardcode.fromJson(Map<String, dynamic> json)
      : name = json['trai'],
        image = json['image'],
        studio = json['studio'],
        time = json['duration'],
        uri = json['link'],
        details = json['description'],
        id = 1;
}

class Stream {
  Timestamp date;
  String description;
  String difficulty;
  String trainer;

  Stream(this.date, this.description, this.difficulty, this.trainer);

  Stream.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        description = json['description'],
        difficulty = json['difficulty'],
        trainer = json['trainer'];
}

class User {
  Timestamp? membership;
  String name;
  int age;
  bool isMember = false;

  User(this.membership, this.name, this.age);
}

class Program {
  List<Hardcode> classes;
  String name;
  String description;
  // bool isMember = false;

  Program(this.classes, this.name, this.description);
}

class Version {
  String version;
  String link;
  // Timestamp date;

  Version(this.version, this.link);
}

List<Hardcode> cyclingList = [];
List<Hardcode> yogaList = [];
List<Hardcode> cardioList = [];
List<Stream> streamList = [];
late Version currentVersion;
User? currentUser;

// Future<Hardcode> getClassById(String id) async {
//   Hardcode result;
//   if (FirebaseAuth.instance.currentUser != null) {
//     await FirebaseFirestore.instance
//         .collection("cycling")
//         .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .get()
//         .then(
//       (value) {
//         //streamList = [];
//         value.docs.forEach(
//           (element) {
//             //print(element.data());
//             // streamList.add(new Stream(
//             //   element.data()['date'],
//             //   element.data()['description'],
//             //   element.data()['difficulty'],
//             //   element.data()['trainer'],
//             // ));
//             currentUser = new User(
//               element.data()['membership'],
//               element.data()['name'],
//               element.data()['age'],
//               //element.data()['s'],
//             );
//             print(currentUser);
//           },
//         );
//       },
//     );
//   }
// }

Future<void> getClasses() async {
  // List<Hardcode> result = [];
  if (FirebaseAuth.instance.currentUser != null) {
    await FirebaseFirestore.instance
        .collection("users")
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
      (value) {
        //streamList = [];
        value.docs.forEach(
          (element) {
            //print(element.data());
            // streamList.add(new Stream(
            //   element.data()['date'],
            //   element.data()['description'],
            //   element.data()['difficulty'],
            //   element.data()['trainer'],
            // ));
            currentUser = new User(
              element.data()['membership'],
              element.data()['name'],
              element.data()['age'],
              //element.data()['s'],
            );
            print(currentUser);
          },
        );
      },
    );
  }
  await FirebaseFirestore.instance.collection("cycling").get().then(
    (value) {
      cyclingList = [];
      value.docs.forEach(
        (element) {
          //print(element.data());
          cyclingList.add(new Hardcode(
              1,
              element.data()['trainer'],
              element.data()['image'],
              element.data()['link'],
              element.data()['description'],
              element.data()['duration'],
              element.data()['studio']));
        },
      );
    },
  );

  await FirebaseFirestore.instance.collection("yoga").get().then(
    (value) {
      yogaList = [];
      value.docs.forEach(
        (element) {
          //print(element.data());
          yogaList.add(new Hardcode(
              1,
              element.data()['trainer'],
              element.data()['image'],
              element.data()['link'],
              element.data()['description'],
              element.data()['duration'],
              element.data()['studio']));
        },
      );
    },
  );

  await FirebaseFirestore.instance.collection("cardio").get().then(
    (value) {
      cardioList = [];
      value.docs.forEach(
        (element) {
          //print(element.data());
          cardioList.add(new Hardcode(
              1,
              element.data()['trainer'],
              element.data()['image'],
              element.data()['link'],
              element.data()['description'],
              element.data()['duration'],
              element.data()['studio']));
        },
      );
    },
  );

  await FirebaseFirestore.instance.collection("streams").get().then(
    (value) {
      streamList = [];
      value.docs.forEach(
        (element) {
          //print(element.data());
          streamList.add(new Stream(
            element.data()['date'],
            element.data()['description'],
            element.data()['difficulty'],
            element.data()['trainer'],
          ));
        },
      );
    },
  );

  await FirebaseFirestore.instance.collection("versions").get().then(
    (value) {
      value.docs.forEach(
        (element) {
          //print(element.data());
          currentVersion = new Version(
            element.data()['version'],
            element.data()['link'],
          );
        },
      );
    },
  );
}
