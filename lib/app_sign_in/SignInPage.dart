import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: Container(
        color: Colors.amber,
        child: new Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.orange,
              child: SizedBox(
                width: 100,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
