import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtulab/functions/database.dart';
import 'package:virtulab/functions/func_all.dart';

// final testStud = new Student(
//   studID: 2170006728,
//   fname: 'Haneen',
//   lname: 'AlRabiah',
//   email: '2170006728@iau.edu.sa',
//   password: 'test',
// );

// test(){
//   Student.addStudent(testStud);
//   print(Student.studenttt());
// }
//...................................... Validate ID ..........................................
_validateID(String id) {
  //id exists?
  firebaseref.child('student').equalTo(id).once().then((snap){
    print(snap);
    if (snap!= null) {
     return 'User already exists';
    }
  });

  //empty
  if (id.isEmpty) {
    return '* Required';
  }
  //length
  if (id.length != 10) {
    return 'Invalid ID';
  }

  
  //pattern (numbers) .. inputFormatters

  return null;
}
//...................................... Validate Name ..........................................

_validateName(String name) {
  if (name.isEmpty) {
    //empty
    return '* Required';
  }
  return null;
}

//...................................... Validate Email ..........................................

_validateEmail(String email) {
  if (email.isEmpty) {
    //empty
    return '* Required';
  }

  bool _valid = EmailValidator.validate(email);
  if (_valid == false) {
    return 'Invalid Email';
  }
  return null;
}
//...................................... Validate Password ..........................................

_validatePass(String pass) {
  if (pass.isEmpty) {
    //empty
    return '* Required';
  }
  return null;
}
//............................................. Widgets...............................................

class SignUp extends StatefulWidget {
  // This widget is the root of the application.
  State<StatefulWidget> createState() {
    return _SignUp();
  }
}

class _SignUp extends State<SignUp> {
  //...................................... Controllers ..........................................

  final _idController = TextEditingController();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _signupForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // title: 'Sign Up',
      // home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('VirtuLab'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double
            .infinity, //to make the contents center ((be as big as the parent allows))
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Form(
          key: _signupForm,
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(
                height: 20,
              ),
              //................................ID........................................
              Container(
                width: 275,
                child: TextFormField(
                  maxLines: 1,
                  minLines: 1,
                  validator: (value) => _validateID(value),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  // keyboardType: TextInputType.number,
                  controller: _idController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Academic ID'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //................................First Name........................................
              Container(
                width: 275,
                child: TextFormField(
                  maxLines: 1,
                  minLines: 1,
                  validator: (value) => _validateName(value),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  ],
                  controller: _fnameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'First Name'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //................................Last Name........................................
              Container(
                width: 275,
                child: TextFormField(
                  maxLines: 1,
                  minLines: 1,
                  validator: (value) => _validateName(value),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  ],
                  controller: _lnameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Last Name'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //................................Email........................................
              Container(
                width: 275,
                child: TextFormField(
                  maxLines: 1,
                  minLines: 1,
                  validator: (value) => _validateEmail(value),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Academic Email'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //................................Password........................................
              Container(
                width: 275,
                child: TextFormField(
                  //onChanged: , //when user leaves this textfield
                  //onFieldSubmitted: , //when user presses submit button
                  maxLines: 1,
                  minLines: 1,
                  validator: (value) => _validatePass(value),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                  ],
                  obscureText: true,
                  controller: _passController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //................................Confirm Password........................................
              Container(
                width: 275,
                child: TextFormField(
                  //onChanged: , //when user leaves this textfield
                  //onFieldSubmitted: , //when user presses submit button
                  maxLines: 1,
                  minLines: 1,
                  validator: (value) {
                    //=> _validateConfirmPass(value),
                    if (value != _passController.text) {
                      return 'Password does not match';
                    } 
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //................................Signup Button........................................
              Container(
                width: 100,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      if (_signupForm.currentState.validate()) {
                        studSignup(
                          _idController.text,
                          _fnameController.text,
                          _lnameController.text,
                          _emailController.text,
                          _passController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Sign Up Successful'),
                            backgroundColor: Colors.deepPurple, //change?
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Sign Up')),
              ),

              SizedBox(
                height: 20,
              ),
              //................................login........................................
              Text(
                'Already have an account?',
                textAlign: TextAlign.center,
              ),
              Container(
                width: 100,
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
            ], //listview children
          ),
        ),
      ),
    );
  }
}
