import 'package:flutter/material.dart';

class ContactSupport extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContactSupport();
  }
}

TextStyle _textStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

// InputDecoration _inputDecor = InputDecoration(
//   border: OutlineInputBorder(),
// );

class _ContactSupport extends State<ContactSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contact Support'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  'Message',
                  style: _textStyle,
                ),
                SizedBox(height: 25),
                TextFormField(
                  //title
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Subject'),
                ),
                SizedBox(height: 25),
                TextFormField(
                  //body
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                    alignLabelWithHint: true,
                  ),
                  maxLength: 500,
                  minLines: 10,
                  maxLines: null,
                ),
                SizedBox(height: 25),
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Send',
                      // style: textStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
