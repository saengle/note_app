import 'package:flutter/material.dart';
import 'package:flutter_note_app/ui/colors.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  static List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion
  ];

  Color _color = roseBud;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _color,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 48, bottom: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: noteColors
                    .map(
                      (color) => InkWell(
                        onTap: () {
                          setState(() {
                            _color = color;
                          });
                        },
                        child: _buildBackgroundColor(
                          color: color,
                          selected: _color == color,
                        ),
                      ),
                    )
                    .toList(),
              ),
              TextField(
                controller: _titleController,
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: '제목을 입력하세요',
                  border: InputBorder.none,
                ),
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: darkGray),
              ),
              TextField(
                controller: _contentController,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: '내용을 입력하세요',
                  border: InputBorder.none,
                ),
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: darkGray),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundColor({
    required Color color,
    required bool selected,
  }) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            spreadRadius: 2,
          )
        ],
        border: selected
            ? Border.all(
                color: Colors.black,
                width: 2,
              )
            : null,
      ),
    );
  }
}
