// import 'dart:js';
// import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart'; //search bar
import 'package:virtulab/functions/class_course.dart';
import 'package:virtulab/functions/database.dart';
import 'package:virtulab/functions/func_all.dart';
import 'package:virtulab/student/stu_activity_stream.dart';
import 'package:virtulab/student/stu_course_contents.dart';
import 'stu_activity_stream.dart';

// Future<List<Course>> searchCourses(String search) async{
//   var maps = getCourses();

// }
// Future<List<Course>> searchCourses(String search) async {
//   //idk i copied and pasted
//   final List <Map<String, dynamic>> maps = getCourses();
//   await Future.delayed(Duration(seconds: 1));
//   return List.generate(maps.length, (int i) { //search
//     return Course.fromJson(
//       id: maps[i]['ID'],
//       code: maps[i]['code'],
//       name: maps[i]['name'],
//       description: maps[i]['description'],
//       instructor: maps[i]['instID'],
//     );
//   });
// }

class StuCourseRegister extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StuCourseRegister();
  }
}

class _StuCourseRegister extends State<StuCourseRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Course Register'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Course>(
            hintText: 'Search Courses',
            emptyWidget: Text('No courses found'),
            onSearch: null,
            onItemFound: (Course course, int index) {
              return ListTile(
                title: Text(course.name),
                subtitle: Text(course.instID),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainStudent()));
                },
              );
            },
          ),
        ),
      ),

      //     Divider(
      //       color: Colors.black,
      //     ),
    );
  }
}
