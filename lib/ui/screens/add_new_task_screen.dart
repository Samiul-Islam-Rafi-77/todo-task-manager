import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/profile_app_bar.dart';
import 'package:task_manager/ui/widgets/background_widget.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEControlar = TextEditingController();
  final TextEditingController _descriptionTEControlar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(),
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEControlar,
                  decoration: const InputDecoration(hintText: 'Title'),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionTEControlar,
                  decoration: InputDecoration(hintText: 'Description'),
                  maxLines: 4,
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () {}, child: const Text('Add')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleTEControlar.dispose();
    _descriptionTEControlar.dispose();
    super.dispose();
  }
}
