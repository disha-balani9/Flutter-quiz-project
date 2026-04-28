import 'package:flutter/material.dart';
import '../data/categories.dart';
import 'quiz_detail_screen.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String search = "";

  @override
  Widget build(BuildContext context) {
    var filtered = categories
        .where((c) =>
        c['name'].toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search category",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() => search = value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, i) {
                var cat = filtered[i];
                return ListTile(
                  title: Text(cat['name']),
                  subtitle: Text("${cat['questions']} Questions"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            QuizDetailScreen(category: cat['name']),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}