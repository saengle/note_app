import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:flutter_note_app/presentation/notes/components/note_item.dart';
import 'package:flutter_note_app/ui/colors.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Note',
          style: TextStyle(fontSize: 30),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEditNoteScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          NoteItem(
            note: Note(
              title: 'title 1',
              content: 'content 1',
              color: wisteria.value,
              timestamp: 1,
            ),
          ),
          NoteItem(
            note: Note(
              title: 'title 2',
              content: 'content 1',
              color: skyBlue.value,
              timestamp: 1,
            ),
          )
        ],
      ),
    );
  }
}
