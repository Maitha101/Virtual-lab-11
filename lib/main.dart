import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtulab/functions/func_all.dart';
import 'package:virtulab/student/stu_caseStudies_list.dart';
import 'package:virtulab/student/stu_course_contents.dart';
import 'package:virtulab/student/stu_experiments_list.dart';
import './sign_up.dart';
import 'student/stu_activity_stream.dart';
import 'student/stu_course_register.dart';
import 'instructor/inst_report.dart';
import 'administrator/admin_main.dart';
import 'tempnav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(VirtuLab());
}

class VirtuLab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/signup': (context) => SignUp(),
        '/student': (context) => MainStudent(), //student
        '/stu_course': (context) => StuCourseRegister(), //student course select
        '/instructor': (context) => MainInstructor(), //instructor
        '/admin': (context) => MainAdmin(), //admin
        '/temp': (context) => TempNaV(), //temporary navigation
        // '/course_page': (context) => StudentCoursePage(),
        // coursesPage[0].route: (context) => Scaffold(
        //     appBar: AppBar(title: Text(coursesPage[0].title)),),  //first route
        // coursesPage[1].route: (context) => Scaffold(
        //     appBar: AppBar(title: Text(coursesPage[1].title)),),
        '/experiment_list': (context) => ExperimentsList(),
        '/caseStudy_list': (context) => CaseStudiesList(),
      },
      title: 'Login',
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  // This widget is the root of the application.
  State<StatefulWidget> createState() {
    return _Homepage();
  }
}

class _Homepage extends State<Homepage> {
  //these take user input from TextFormField
  final _idController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //test on this line
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('VirtuLab'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          //color: Colors.grey[300],
          width: double
              .infinity, //to make the contents center ((be as big as the parent allows))
          height: double.infinity,
          padding: EdgeInsets.all(20),
          child: ListView(children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/logo.png',
                // width: 200,
                height: 200,
                fit: BoxFit.contain,
                semanticLabel: 'VirtuLab Logo', //image description
              ), // written in pubspec.yaml

              SizedBox(
                height: 20,
              ), //space between widgets

              Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: 20,
              ),
              //............................................ID............................................
              Container(
                width: 275,
                child: TextFormField(
                  controller: _idController,
                  maxLines: 1,
                  minLines: 1,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Academic ID'),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              // .........................................Password........................................
              Container(
                width: 275,
                child: TextFormField(
                  controller: _passController,
                  maxLines: 1,
                  minLines: 1,
                  //onChanged: , //when user leaves this textfield
                  //onFieldSubmitted: , //when user presses submit button
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                width: 150,
                height: 50,
                child: ElevatedButton(
                    onPressed: () => login(_idController.text,
                        _passController.text, context), //login function
                    // Navigator.pushNamed(context, '/temp'), // route
                    child: Text('Login')),
              ),

              SizedBox(
                height: 20,
              ),

              Text(
                'Don\'t have an account?',
                textAlign: TextAlign.center,
              ),
              Container(
                width: 100,
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context,
                      '/signup'), //defined in MaterialApp (routes: {}) at the top

                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
