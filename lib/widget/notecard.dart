import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

Widget noteCard(onTap, QueryDocumentSnapshot doc) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    child: SwipeActionCell(
      key: ObjectKey(doc),
      trailingActions: <SwipeAction>[
        SwipeAction(
            performsFirstActionWithFullSwipe: true,
            title: "delete",
            onTap: onTap,
            color: Colors.red),
      ],
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              doc['note_title'],
              style: const TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              doc['date'],
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              doc['note_subtitle'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    ),
  );
}
