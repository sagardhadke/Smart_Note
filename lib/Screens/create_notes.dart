import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNotes extends StatelessWidget {
  CreateNotes({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF252525),
      appBar: AppBar(
        backgroundColor: Color(0XFF252525),
        scrolledUnderElevation,
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0XFF3D3D3D),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Save",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: descController,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: 'Type Something...',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
