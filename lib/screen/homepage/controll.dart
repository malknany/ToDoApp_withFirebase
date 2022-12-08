import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/screen/homepage/modle.dart';

class NoteController {
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  String dateTime = DateFormat.jms().format(DateTime.now());
  int id = 1;

  addDataToFireBase(context, TextEditingController title,
      TextEditingController subtitle, String dateTime, int id) {
    FirebaseFirestore.instance
        .collection('notes')
        .add(NoteModel.noteMap(
            title: title.text,
            date: dateTime.toString(),
            subTitle: subtitle.text,
            id: id++))
        .then((value) {
      print(value.id);
      Navigator.pop(context);
      title.clear();
      subtitle.clear();
    }).catchError((error) => print('Filed to add $error'));
  }

  deleteDataFromFireBase(note) {
    FirebaseFirestore.instance.collection('notes').doc(note.id).delete();
  }
}
