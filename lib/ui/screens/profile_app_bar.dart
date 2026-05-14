import 'package:flutter/material.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

AppBar profileAppBar() {
  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading: const Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        // child: NetworkCachedImage(
        //   url: '',
        //   width: width,
        //   height: height,
        //   fit: fit,
        // ),
      ),
    ),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dummy name', style: TextStyle(fontSize: 16, color: Colors.white)),
        Text(
          'email@gmail.com ',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    ),
    actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
  );
}
