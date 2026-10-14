import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final csSubjects = [
      "Machine Learning",
      "Data Science",
      "Data engineering",
      "Software development",
      "DevOps",
      "Quality Aspects",
      "Data Analysis",
      "AI Automation",
      "AI Engineering",
    ];
    final screenwidth = MediaQuery.sizeOf(context).width;
    final screenheight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My App',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            color: Colors.amber,
          ),
        ),
      ),
      body: Container(
        // constraints: const BoxConstraints(
        //   minHeight: 300,
        //   maxHeight: 600,
        //   minWidth: 400,
        //   maxWidth: double.infinity,
        // ),
        height: screenheight - 300,
        width: screenwidth,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(11, 12),
            ),
          ],
        ),
        // it provides a scrollable sequence of children
        child: ListView(
          padding: EdgeInsets.all(12),
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Semik"),
              subtitle: Text("Phidim"),
              trailing: Icon(Icons.home),
              textColor: Colors.blueGrey,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Prakash"),
              subtitle: Text("Dharan"),
              trailing: Icon(Icons.home),
              textColor: Colors.blueGrey,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Ram"),
              subtitle: Text("Koshi"),
              trailing: Icon(Icons.home),
              textColor: Colors.blueGrey,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Reaper"),
              subtitle: Text("Phidim"),
              trailing: Icon(Icons.home),
              textColor: Colors.blueGrey,
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Sae"),
              subtitle: Text("Japan"),
              trailing: Icon(Icons.home),
              textColor: Colors.blueGrey,
            ),

            // child: ListView.builder(
            //   itemCount: csSubjects.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       leading: const Icon(Icons.subject),
            //       title: Text(csSubjects[index]),
            //       onTap: () {
            //         print("Selected ${csSubjects[index]}");
            //       },
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
