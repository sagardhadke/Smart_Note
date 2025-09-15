import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_note/Routes/app_routes.dart';
import 'package:smart_note/data/constants.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "Notes",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
        backgroundColor: Color(0XFF252525),
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Color(0XFF3D3D3D),
                shape: BoxShape.circle,
              ),
              child: Icon(CupertinoIcons.search),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0XFF252525),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
        ),
        itemCount: Constants.myNotes.length,
        itemBuilder: (BuildContext context, int index) {
          final bgColor = Constants.myNotes[index]['bgColor'];
          return InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.notesDetails,
              arguments: Constants.myNotes[index],
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, bgColor[0], bgColor[1], bgColor[2]),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Constants.myNotes[index]['title'],
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    Constants.myNotes[index]['date'],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AppRoutes.createNotes),
        backgroundColor: Color(0XFF252525),
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
