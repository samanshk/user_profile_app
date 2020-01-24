import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  // var flutter = 'asstes/flutter.png';
  File _userImage;
  
  
  bool isDark = false;
  void changeBrightness() {
    DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
  }

  Future clickImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _userImage = image; 
    });
  }
  Future selectImage() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _userImage = image; 
    });
  }
  _launchURL() async {
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      // appBar: AppBar(
      //   title: Text('Home'),
      //   backgroundColor: Color.fromARGB(0, 255, 255, 255),
      // ),
      key: key,
      drawer: Drawer(
        child:
        ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('samansh1999@gmail.com'),
              accountName: Text('Samansh'),
              currentAccountPicture: (_userImage == null ? Image.asset('assets/flutter.png') : Image.asset(_userImage.path)),
              onDetailsPressed: () {Navigator.pushNamed(context, '/Login');},
            ),
            Text(
              ' Favourite Apps',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Divider(thickness: 2,),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'),
              onTap: clickImage,
            ),
            ListTile(
              leading: Icon(Icons.apps),
              title: Text('Gallery'),
              onTap: selectImage,
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Internet'),
              onTap: _launchURL,
            ),

            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Sign up'),
              onTap: () {Navigator.pushNamed(context, '/Signup');},
            ),
            Padding(padding: EdgeInsets.all(40)),
            Text(
              ' Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Divider(thickness: 2,),
            ListTile(
              title: Text('Dark mode'),
              trailing: Switch(
                value: isDark,
                onChanged: (value) {
                  changeBrightness();
                  setState(() {
                    isDark = value;
                  });
                },
              ),
              // trailing: ToggleButtons(),
            ),
            ListTile(
              trailing: Text('< Back'),
              onTap: () {Navigator.pop(context);},
            ),
          ],
        )
      ),
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                // height: double.infinity,
                // width: 800,
              Expanded(
                child: Image.asset('assets/home.jpeg', height: double.infinity, fit: BoxFit.cover,),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(20),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(child: Icon(Icons.battery_full, color: Colors.green,), radius: 20, backgroundColor: Colors.transparent,),
                          CircleAvatar(child: Icon(Icons.calendar_today, color: Colors.blue), radius: 20, backgroundColor: Colors.transparent,),
                          CircleAvatar(child: Icon(Icons.music_note, color: Colors.amber), radius: 20, backgroundColor: Colors.transparent,),
                          CircleAvatar(child: Icon(Icons.line_style, color: Colors.red), radius: 20, backgroundColor: Colors.transparent,),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(20),),
                      Text(
                        'Friday, Jan 10',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Today is an amazing day. Today is an amazing day. Today is an amazing day',
                        // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Padding(padding: EdgeInsets.all(10),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          MaterialButton(
                            onPressed: () {launch("tel://(9828648484)");},
                            color: Colors.white,
                            splashColor: Colors.blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Call',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),                            
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {launch("sms://(9828648484)");},
                            color: Colors.white,
                            splashColor: Colors.blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Text',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),                            
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {launch("mailto://(samansh1999@gmail.com)");},
                            color: Colors.white,
                            splashColor: Colors.blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Email',
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),                            
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              )
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Icon(Icons.wb_sunny, color: Colors.yellow),
                      Text(
                        'It\'s now 30 Celsius',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      Icon(Icons.flight, color: Colors.blue),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: IconButton(
              onPressed: () {key.currentState.openDrawer();},
              icon: Icon(Icons.menu, size: 30, color: Colors.white),
            )
          )
        ],
      ),
    );
  }
}