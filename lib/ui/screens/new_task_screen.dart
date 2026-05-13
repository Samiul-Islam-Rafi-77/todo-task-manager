import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/profile_app_bar.dart';
import 'package:task_manager/ui/utility/app_colors.dart';
import 'package:task_manager/ui/widgets/network_cached_image.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TaskSummaryCard(title: 'New Task', count: '34'),
                TaskSummaryCard(title: 'Completed', count: '34'),
                TaskSummaryCard(title: 'In Progress', count: '34'),
                TaskSummaryCard(title: 'Concelled', count: '34'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TaskSummaryCard extends StatelessWidget {
  const TaskSummaryCard({super.key, required this.title, required this.count});

  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(count, style: Theme.of(context).textTheme.titleLarge),
            Text(title, style: Theme.of(context).textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}
