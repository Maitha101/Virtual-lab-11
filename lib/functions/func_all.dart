import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:virtulab/functions/database.dart';
import 'package:virtulab/tempnav.dart';

// Future<List<DataSnapshot>> getCourses() async {

//   var result = firebaseref.child('course').once().then((DataSnapshot snapshot) {
//     Map<dynamic, dynamic> courseValues = snapshot.value;
//     courseValues.forEach((key, value) {
//       print(courseValues[{'code', 'name', 'description'}]);
//     });
//   });
//   return await result;
// }

getAll() {
  firebaseref.once().then((DataSnapshot snapshot) {
    print('All Data: ${snapshot.value}');
  });
}

getCourse() {
  firebaseref
      .child('course')
      .child('1')
      .child('instID')
      .once()
      .then((DataSnapshot snapshot) {
    String _instID = snapshot.value;
    firebaseref
        .child('instructor')
        .child(_instID)
        .child('name')
        .once()
        .then((DataSnapshot snapshot) {
      print(snapshot.value);
    });
  }); //get instructor name from instID in course

  firebaseref.child('course').child('1').once().then((DataSnapshot snapshot) {
    // print(snapshot.value);
    Map<dynamic, dynamic> courseValue = snapshot.value;
    courseValue.forEach((key, value) {
      print(courseValue['code']);
      print(courseValue['name']);
      print(courseValue['description']);
      //printss them 5 times for some reason
    });
  });
}

addCourse(String id, String code, String name, String description, String instID) {
  firebaseref.child('course').push().set({
    'code': code,
    'name': name,
    'description': description,
    'instID': instID
  });
}

studSignup(String id, String fname, String lname, String email, String pass) async {
  firebaseref.child('student').child(id).set({
    'ID': id,
    'fname': fname,
    'lname': lname,
    'email': email,
    'password': pass
  });

  // try {
  //   UserCredential student =
  //       await auth.createUserWithEmailAndPassword(email: id, password: pass);
  // } on FirebaseAuthException catch (e) {
  //   if (e.code == 'weak-password') {
  //     print('The password provided is too weak.');
  //   } else if (e.code == 'email-already-in-use') {
  //     print('The account already exists with this ID.');
  //   }
  // } catch (e) {
  //   print(e);
  // }
}

addInst(String id, String fname, String lname, String email, String pass) {
  firebaseref.child('instructor').child(id).set({
    'ID': id,
    'fname': fname,
    'lname': lname,
    'email': email,
    'password': pass
  });
}

login(String id, String pass, context) async {
  // try {
  //   UserCredential student = await auth.signInWithEmailAndPassword(
  //     email: id,
  //     password: pass,
  //   );
  // } on FirebaseAuthException catch (e) {
  //   if (e.code == 'user-not-found') {
  //     print('No user found for that ID.');
  //   } else if (e.code == 'wrong-password') {
  //     print('Incorrect password.');
  //   }
  // }

  Navigator.push(
      context, MaterialPageRoute(builder: (BuildContext context) => TempNaV()));
}

void signOut() { //havemt tested this
  FirebaseAuth.instance.signOut();
}
