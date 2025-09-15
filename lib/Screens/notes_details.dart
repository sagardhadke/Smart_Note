import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNoteDetails extends StatelessWidget {
  MyNoteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> notesDetails =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Color(0XFF252525),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Color(0XFF252525),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Color(0XFF3D3D3D),
                shape: BoxShape.circle,
              ),
              child: Icon(CupertinoIcons.back, color: Colors.white),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Color(0XFF3D3D3D),
                shape: BoxShape.circle,
              ),

              child: Icon(Icons.edit_note, color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                notesDetails['title'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              SizedBox(height: 15),
              Text(
                notesDetails['date'],
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 15),
              Text(
                notesDetails['desc'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
