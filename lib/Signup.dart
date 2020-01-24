import 'package:flutter/material.dart';
import 'Profile.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController project = TextEditingController();
  TextEditingController apps = TextEditingController();
  TextEditingController repo = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController pass2 = TextEditingController();
  String msg = '';
  bool verified = false;
   verify() {
    if (name.text.isEmpty) {
      msg = 'Enter your name';
    }
    else if(email.text.isEmpty) {
      msg = 'Enter your email';
    }
    else if(pass.text.isEmpty) {
      msg = 'Enter your password';
    }
    else if(pass2.text.isEmpty) {
      msg = 'Re-enter your password';
    }
    else if (pass.text.length >= 10 && !pass.text.contains(RegExp(r'\W')) && RegExp(r'\d+\w*\d+').hasMatch(pass.text)) {
        if (pass.text == pass2.text) {
          verified = true;
        } else 
          msg = 'Passwords do not match';
    }
    else {
      msg = 'Invalid password';
    }

    setState(() {
      msg = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(40),),
              Text(
                'Sign up',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(msg),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Name',
                  icon: Icon(Icons.person, color: Colors.blue,),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  icon: Icon(Icons.email, color: Colors.blue,),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: project,
                decoration: InputDecoration(
                  hintText: 'Projects',
                  icon: Icon(Icons.work, color: Colors.blue,),
                ),
                keyboardType: TextInputType.number,
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: apps,
                decoration: InputDecoration(
                  hintText: 'Applications',
                  icon: Icon(Icons.apps, color: Colors.blue,),
                ),
                keyboardType: TextInputType.number,
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: repo,
                decoration: InputDecoration(
                  hintText: 'Repositories',
                  icon: Icon(Icons.present_to_all, color: Colors.blue,),
                ),
                keyboardType: TextInputType.number,
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: pass,
                decoration: InputDecoration(
                  hintText: 'Password',
                  icon: Icon(Icons.lock_open, color: Colors.blue,),
                ),
                obscureText: true,
              ),
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: pass2,
                decoration: InputDecoration(
                  hintText: 'Re-enter password',
                  icon: Icon(Icons.lock_outline, color: Colors.blue,),
                ),
                obscureText: true,
              ),
              Padding(padding: EdgeInsets.all(10)),
              MaterialButton(
                onPressed: () {
                  verify();
                  if(verified) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(name.text, project.text, apps.text, repo.text)
                      )
                    );
                  }
                },
                color: Colors.blue,
                child: Text(
                  'Signup',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20)
                ),
                padding: EdgeInsets.all(10),
              ),
              // Padding(padding: EdgeInsets.all(10)),
              // Divider(thickness: 2, color: Colors.white,),
              // Padding(padding: EdgeInsets.all(10)),
              // MaterialButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   color: Colors.blue,
              //   child: Text(
              //     'Already have an account',
              //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20)
              //   ),
              //   padding: EdgeInsets.all(10),
              // )
            ],
          ),
        ),
      ),
    );
  }
}