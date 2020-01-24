import 'package:flutter/material.dart';
import 'Signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Padding(padding: EdgeInsets.all(40),)
            Image.asset('assets/flutter.png', height: 100, width: 100, alignment: Alignment(-1, 0),),
            Text(
              'Welcome',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Padding(padding: EdgeInsets.all(2)),
            Text(
              'Sign in to continue',
              style: TextStyle(color: Colors.grey, fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(20)),
            TextField(
              decoration: InputDecoration(
                hintText: 'Username',
                icon: Icon(Icons.lock, color: Colors.blue,),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              decoration: InputDecoration(
                hintText: 'Username',
                icon: Icon(Icons.person, color: Colors.blue,),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            MaterialButton(
              onPressed: () {},
              color: Colors.blue,
              child: Text(
                'Log in',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20)
              ),
              padding: EdgeInsets.all(10),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Divider(thickness: 2, color: Colors.white,),
            Padding(padding: EdgeInsets.all(10)),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Signup()
                  )
                );
              },
              color: Colors.blue,
              child: Text(
                'Create an account',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20)
              ),
              padding: EdgeInsets.all(10),
            )
          ],
        ),
      ),
    );
  }
}