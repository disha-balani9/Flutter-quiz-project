import 'package:flutter/material.dart';
import '../Services/api_service.dart';
import 'Notification_screen.dart';
import 'category_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  void showNotifications(BuildContext context) async {

    final data = await ApiService.getNotifications();

    showModalBottomSheet(
      context: context,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      builder: (context) {

        return Container(
          padding: EdgeInsets.all(16),
          height: 400,

          child: Column(
            children: [

              Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Expanded(
                child: ListView.builder(

                  itemCount: data.length,

                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.notifications),

                        title: Text(data[index].title),

                        subtitle: Text(data[index].message),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // 🔹 APP BAR
      appBar: AppBar(
        title: Text("Quiz Categories"),

        actions: [

          // 🔍 SEARCH ICON
          // IconButton(
          //   icon: Icon(Icons.search),
          //
          //   onPressed: () {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(
          //         content: Text("Search feature coming soon"),
          //       ),
          //     );
          //   },
          // ),

          // 🔔 NOTIFICATION ICON

          IconButton(
            icon: Icon(Icons.notifications),

            onPressed: () {

              showNotifications(context);

            },
          ),
        ],
      ),

      // 🔹 BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // 🔹 WELCOME TEXT
              Text(
                "Welcome Back 👋",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "Ready to test your knowledge?",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),

              SizedBox(height: 30),

              // 🔹 FEATURED CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Icon(
                      Icons.quiz,
                      color: Colors.white,
                      size: 50,
                    ),

                    SizedBox(height: 20),

                    Text(
                      "Start Your Quiz Journey",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Explore categories and improve your skills.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: 20),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.indigo,
                      ),

                      child: Text("Browse Categories"),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CategoryScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // 🔹 QUICK STATS
              // Text(
              //   "Quick Stats",
              //   style: TextStyle(
              //     fontSize: 22,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),

              // SizedBox(height: 20),

              // Row(
              //   children: [

                  // 🔹 QUIZZES CARD
                  // Expanded(
                  //   child: Card(
                  //     elevation: 4,
                  //
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //     ),
                  //
                  //     child: Padding(
                  //       padding: EdgeInsets.all(20),
                  //
                  //       child: Column(
                  //         children: [
                  //
                  //           Icon(
                  //             Icons.assignment,
                  //             color: Colors.indigo,
                  //             size: 40,
                  //           ),
                  //
                  //           SizedBox(height: 10),
                  //
                  //           Text(
                  //             "12",
                  //             style: TextStyle(
                  //               fontSize: 22,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //
                  //           Text("Quizzes"),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  //
                  // SizedBox(width: 15),

                  // 🔹 SCORE CARD
              //     Expanded(
              //       child: Card(
              //         elevation: 4,
              //
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(15),
              //         ),
              //
              //         child: Padding(
              //           padding: EdgeInsets.all(20),
              //
              //           child: Column(
              //             children: [
              //
              //               Icon(
              //                 Icons.star,
              //                 color: Colors.orange,
              //                 size: 40,
              //               ),
              //
              //               SizedBox(height: 10),
              //
              //               Text(
              //                 "85%",
              //                 style: TextStyle(
              //                   fontSize: 22,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //
              //               Text("Best Score"),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              //
              // SizedBox(height: 30),

              // 🔹 RECENT ACTIVITY
              // Text(
              //   "Recent Activity",
              //   style: TextStyle(
              //     fontSize: 22,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              //
              // SizedBox(height: 15),

              // Card(
              //   child: ListTile(
              //     leading: CircleAvatar(
              //       backgroundColor: Colors.indigo,
              //       child: Icon(Icons.code, color: Colors.white),
              //     ),
              //
              //     title: Text("Flutter Quiz"),
              //
              //     subtitle: Text("Score: 8/10"),
              //
              //     trailing: Icon(Icons.arrow_forward_ios),
              //   ),
              // ),

              // Card(
              //   child: ListTile(
              //     leading: CircleAvatar(
              //       backgroundColor: Colors.green,
              //       child: Icon(Icons.computer, color: Colors.white),
              //     ),
              //
              //     title: Text("Programming Quiz"),
              //
              //     subtitle: Text("Score: 7/10"),
              //
              //     trailing: Icon(Icons.arrow_forward_ios),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}