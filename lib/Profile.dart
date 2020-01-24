import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:login_signup/main.dart';

class Profile extends StatefulWidget {
  String name, project, apps, repo;
  Profile(this.name, this.project, this.apps, this.repo);
  @override
  _ProfileState createState() => _ProfileState(name, project, apps, repo);
}

class _ProfileState extends State<Profile> {
  String myName, myProjects, myApps, myrepo;
  _ProfileState(this.myName, this.myProjects, this.myApps, this.myrepo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.green,
            transform: Matrix4.rotationZ(.2),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 100,
                    // child: Image.asset('assets/flutter.png'),
                    // backgroundColor: Colors.red,
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/459225/pexels-photo-459225.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Text(myName, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  Text('Role', style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(myProjects != null ? myProjects : '0', style: TextStyle(fontSize: 20)),
                          Text('Projects')
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(myApps != null ? myApps : '0', style: TextStyle(fontSize: 20)),
                          Text('Applications')
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(myrepo != null ? myrepo : '0', style: TextStyle(fontSize: 20)),
                          Text('Repositories')
                        ],
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(20),),
                  MaterialButton(
                  onPressed: () {},
                  color: Colors.blue,
                  child: Text(
                    'Follow',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20)
                  ),
                  padding: EdgeInsets.all(10),
                ),
                ],
              ),
            ),
          )
        ],
      )
      
      
    );
  }
}