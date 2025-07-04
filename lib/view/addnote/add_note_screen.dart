import 'package:flutter/material.dart';
import 'package:scribble/scribble.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  late ScribbleNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = ScribbleNotifier();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scribble Example'),
      ),
      body: Column(
        children: [
          // Çizim alanı
          Expanded(
            child: Scribble(
              notifier: _notifier,
              drawPen: true,
            ),
          ),
          // Araç Çubuğu
          SizedBox(
            height: 80,
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.edit),
                    label: const Text("Pencil"),
                    onPressed: () {
                      _notifier.setColor(Colors.black);
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.cleaning_services),
                    label: const Text("Eraser"),
                    onPressed: () {
                      _notifier.setEraser();
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.undo),
                    label: const Text("Undo"),
                    onPressed: () {
                      _notifier.undo();
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.redo),
                    label: const Text("Redo"),
                    onPressed: () {
                      _notifier.redo();
                    },
                  ),
                  PopupMenuButton<Color>(
                    icon: const Icon(Icons.color_lens),
                    onSelected: (color) {
                      _notifier.setColor(color);
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: Colors.black,
                        child: const Text('Black'),
                      ),
                      PopupMenuItem(
                        value: Colors.red,
                        child: const Text('Red'),
                      ),
                      PopupMenuItem(
                        value: Colors.blue,
                        child: const Text('Blue'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
