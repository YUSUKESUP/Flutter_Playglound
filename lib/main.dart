import 'package:flutter/material.dart';
import 'package:flutter_playground/workout_app/data/worlout_data.dart';
import 'package:flutter_playground/workout_app/models/workout.dart';
import 'package:flutter_playground/workout_app/workout_home_page.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'memos/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)  => WorkoutData(),
     child: const MaterialApp(
       debugShowCheckedModeBanner: false,
       home: WorkooutHomePage(),
     ),
    );

  }
}