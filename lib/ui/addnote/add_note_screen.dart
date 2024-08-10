import 'package:flutter/material.dart';
import 'package:notumcepte/utility/constants.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        title: Text(
          "Add Note",
          style: K.kAppbarTextStyle(context),
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
