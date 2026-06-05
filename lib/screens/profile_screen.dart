import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String name = "";
  String email = "";
  String phone = "";

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {

      name = prefs.getString("name") ?? "No Name";
      email = prefs.getString("email") ?? "No Email";
      phone = prefs.getString("phone") ?? "No Phone";

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text("Profile")),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),

            SizedBox(height: 20),

            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text("Flutter Developer"),

            SizedBox(height: 30),

            ListTile(
              leading: Icon(Icons.email),
              title: Text(email),
            ),

            ListTile(
              leading: Icon(Icons.phone),
              title: Text(phone),
            ),
          ],
        ),
      ),
    );
  }
}