import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List<Map<String, dynamic>> categories = [

    {
      "name": "Flutter",
      "questions": 10,
      "icon": Icons.phone_android,
    },

    {
      "name": "Programming",
      "questions": 15,
      "icon": Icons.computer,
    },

    {
      "name": "Science",
      "questions": 12,
      "icon": Icons.science,
    },

    {
      "name": "Mathematics",
      "questions": 8,
      "icon": Icons.calculate,
    },
  ];

  String search = "";

  @override
  Widget build(BuildContext context) {

    final filteredCategories = categories.where((cat) {

      return cat["name"]
          .toLowerCase()
          .contains(search.toLowerCase());

    }).toList();

    return Scaffold(

      appBar: AppBar(
        title: Text("Categories"),

        actions: [
          IconButton(
            icon: Icon(Icons.notifications),

            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("No new notifications"),
                ),
              );
            },
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(

          children: [

            // 🔍 SEARCH BAR
            TextField(

              decoration: InputDecoration(

                hintText: "Search categories",

                prefixIcon: Icon(Icons.search),

                filled: true,

                fillColor: Colors.white,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),

              onChanged: (value) {

                setState(() {
                  search = value;
                });
              },
            ),

            SizedBox(height: 20),

            // 🔹 CATEGORY LIST
            Expanded(
              child: ListView.builder(

                itemCount: filteredCategories.length,

                itemBuilder: (context, index) {

                  final cat = filteredCategories[index];

                  return Card(

                    elevation: 4,

                    margin: EdgeInsets.only(bottom: 15),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: ListTile(

                      contentPadding: EdgeInsets.all(15),

                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.indigo,

                        child: Icon(
                          cat["icon"],
                          color: Colors.white,
                        ),
                      ),

                      title: Text(
                        cat["name"],

                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),

                      subtitle: Text(
                        "${cat["questions"]} Questions",
                      ),

                      trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuizScreen(
                                category: cat["name"],
                              ),
                            ),
                          );
                        }

                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}