import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/cancelled_task_screen.dart';
import 'package:task_manager/ui/screens/completed_task_screen.dart';
import 'package:task_manager/ui/screens/in_progress_task_screen.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/screens/profile_app_bar.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

class MainButtomNavScreen extends StatefulWidget {
  const MainButtomNavScreen({super.key});

  @override
  State<MainButtomNavScreen> createState() => _MainButtomNavScreenState();
}

class _MainButtomNavScreenState extends State<MainButtomNavScreen> {
  //5th
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    InProgressTaskScreen(),
    CancelledTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(),
      body: _screens[_selectedIndex],
      // bottom navigation part --1st
      bottomNavigationBar: BottomNavigationBar(
        //3rd
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (!mounted) return;
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: AppColors.themeColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,

        //2nd
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'New Task'),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_outline),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'In Progress',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: 'Cancelled'),
        ],
      ),
    );
  }
}
