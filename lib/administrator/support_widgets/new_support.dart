import 'package:flutter/material.dart';

class NewTSMessage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewTSMessage();
  }
}

class _NewTSMessage extends State<NewTSMessage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround, //delete later
      children: [
        Container(
          padding: EdgeInsets.all(15),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [

              Text('Sort?'),
              Icon(Icons.sort),
              Text('      '), //idk gives space
              Text('Filter?'),
              Icon(Icons.filter_alt),
              
              
            ],
          ),
        ),
        Expanded(
          child: new ListView.builder(
            // itemCount: courseNames.length,
            itemBuilder: (context, index) {
              Widget column = Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Multiple texts in a widget
                    Text(
                      'Fname Lname',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 2,
                          color: Colors.deepPurple),
                    ),
                    Text('message\ngrtgrfg\ndrgdfvdf'),
                  ],
                ),
              ));
              return Card(
                child: InkWell(
                  onTap: null, // show whole message
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.account_circle),
                        column,
                        // Icon(Icons.message),
                        Text('date')
                      ],
                    ),
                  ),
                ),
              );
              // Navigate when tapped
            },
          ),
        ),
      ],
    );
  }
}
