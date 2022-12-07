import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteController{
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  String dateTime = DateFormat.jms().format(DateTime.now());
  int id = 1;
  addDataToFireBase(context,title,subtitle,dateTime,id){
    FirebaseFirestore.instance.collection('notes').add({
      'note_title': title.text,
      'note_subtitle': subtitle.text,
      'date': dateTime,
      'id': id++,
    }).then((value) {
      print(value.id);
      Navigator.pop(context);
      title.clear();
      subtitle.clear();
    }).catchError(
            (error) => print('Filed to add $error'));

  }
  deleteDataFromFireBase(note){
    FirebaseFirestore.instance
        .collection('notes')
        .doc(note.id)
        .delete();
  }
}