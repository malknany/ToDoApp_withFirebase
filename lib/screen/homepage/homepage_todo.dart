import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:todo/screen/homepage/controll.dart';
import 'package:todo/widget/item_alart_dialog.dart';
import 'package:todo/widget/notecard.dart';

class HomePageToDo extends StatefulWidget {
  const HomePageToDo({Key? key}) : super(key: key);

  @override
  State<HomePageToDo> createState() => _HomePageToDoState();
}

class _HomePageToDoState extends State<HomePageToDo> {
  NoteController controller = NoteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Notes',
                style: TextStyle(fontSize: 35, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('notes')
                      .orderBy('id', descending: true)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      );
                    }
                    if (snapshot.hasData) {
                      return ListView(
                        children: snapshot.data!.docs
                            .map((note) =>
                                noteCard((CompletionHandler handler) async {
                                  // delet data from databese
                                  await controller.deleteDataFromFireBase(note);
                                }, note))
                            .toList(),
                      );
                    }
                    return const Text(
                      'there is no Notes',
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Add Your Note',
                  style: TextStyle(color: Colors.teal),
                ),
                content: ItemDialog(
                    dateTime: controller.dateTime,
                    title: controller.title,
                    subtitle: controller.subtitle),
                actions: [
                  // add data to firebase
                  IconButton(
                      onPressed: () async {
                        if (controller.title.text.isNotEmpty &&
                            controller.subtitle.text.isNotEmpty) {
                          controller.addDataToFireBase(
                              context,
                              controller.title,
                              controller.subtitle,
                              controller.dateTime,
                              controller.id);
                        }
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.teal,
                      ))
                ],
              );
            },
          );
        },
        backgroundColor: Colors.white,
        elevation: 0.5,
        label: const Text(
          'Add Note',
          style: TextStyle(color: Colors.teal),
        ),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
      ),
    );
  }
}
