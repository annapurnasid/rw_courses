import 'package:flutter/material.dart';
import 'package:sh_courses/rwcourses_app.dart';
import 'package:sh_courses/state/filter_state_container.dart';
import 'package:sh_courses/strings.dart';

void main() => runApp(FilterStateContainer(
      child: MaterialApp(
        title: Strings.appTitle,
        theme: ThemeData(primaryColor: Colors.green.shade800),
        home: const RWCoursesApp(),
      ),
    ));
