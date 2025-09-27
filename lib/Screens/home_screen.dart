import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_note/Routes/app_routes.dart';
import 'package:smart_note/database/db_helper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DBHelper? dbRef;
  List<Map<String, dynamic>> getAllNotes = [];
  DateFormat df = DateFormat.yMMMEd();

  @override
  void initState() {
    super.initState();
    dbRef = DBHelper.getInstance;
    fetchAllNote();
  }

  Future<void> fetchAllNote() async {
    getAllNotes = await dbRef!.fetchAllSmartNotes();
    print("All Smart Note $getAllNotes");
    setState(() {});
  }

  void formateDate() {}

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
      body: getAllNotes.isNotEmpty
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
              ),
              padding: EdgeInsets.all(7),
              // itemCount: Constants.myNotes.length,
              itemCount: getAllNotes.length,
              itemBuilder: (BuildContext context, int index) {
                // final bgColor = Constants.myNotes[index]['bgColor'];
                return InkWell(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoutes.notesDetails,
                    // arguments: Constants.myNotes[index],
                    arguments: getAllNotes[index],
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(
                        getAllNotes[index][DBHelper.smartNoteBgColor], 
                      ),
                      // color: Color.fromARGB(255, bgColor[0], bgColor[1], bgColor[2]),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // Constants.myNotes[index]['title'],
                          getAllNotes[index][DBHelper.smartNoteTitle],
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          // Constants.myNotes[index]['date'],
                          df.format(
                            DateTime.fromMillisecondsSinceEpoch(
                              int.parse(
                                getAllNotes[index][DBHelper.smartNoteCreatedAt],
                              ),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Align(
                          alignment: AlignmentGeometry.bottomRight,
                          child: IconButton(
                            onPressed: () async {
                              bool isNoteDeleted = await dbRef!.deleteSmartNote(
                                id: getAllNotes[index][DBHelper.smartNoteId],
                              );
                              if (isNoteDeleted) {
                                fetchAllNote();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Smart Note Has Been Deleted Successfully",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    backgroundColor: Colors.green,
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                            icon: Icon(
                              CupertinoIcons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Column(
                spacing: 15,
                children: [
                  Text(
                    'No Notes Available',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => fetchAllNote(),
                    child: Text("Fetch All Note"),
                  ),
                ],
              ),
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
