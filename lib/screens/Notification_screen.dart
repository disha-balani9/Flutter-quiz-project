import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Services/api_service.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() =>
      _NotificationScreenState();
}

class _NotificationScreenState
    extends State<NotificationScreen> {

  List notifications = [];

  bool isLoading = true;

  @override

  @override
  void initState() {
    super.initState();
    loadNotifications();
  }

  void loadNotifications() async {

    final data = await ApiService.getNotifications();

    setState(() {
      notifications = data;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Notifications"),
      ),

      body: isLoading

          ? Center(
        child: CircularProgressIndicator(),
      )

          : notifications.isEmpty

          ? Center(
        child: Text(
          "No Notifications Found",
          style: TextStyle(fontSize: 20),
        ),
      )

          : ListView.builder(

        itemCount: notifications.length,

        itemBuilder: (context, index) {

          return Card(

            margin: EdgeInsets.all(10),

            child: ListTile(

              leading: CircleAvatar(
                child: Icon(Icons.notifications),
              ),

              title: Text(
                notifications[index].title
                    .toString(),
              ),

              subtitle: Text(
                notifications[index].message
                    .toString(),
              ),
            ),
          );
        },
      ),
    );
  }
}