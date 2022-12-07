import 'package:flutter/material.dart';
class ItemDialog extends StatelessWidget {
  const ItemDialog({Key? key,required this.dateTime,required this.title,required this.subtitle}) : super(key: key);
  final dateTime;
  final title;
  final subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Text(
            dateTime.toString(),
            style: const TextStyle(
                fontSize: 17,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: title,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Title Note',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: subtitle,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter Note',
            ),
          ),
        ],
      ),
    );
  }
}
