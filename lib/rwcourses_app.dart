import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sh_courses/strings.dart';
import 'package:sh_courses/ui/filter/filter_page.dart';

import 'ui/courses/courses_page.dart';

class RWCoursesApp extends StatelessWidget {
  const RWCoursesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
        actions: <Widget>[
          IconButton(
              onPressed: () => Navigator.of(context).push<MaterialPageRoute>(
                  MaterialPageRoute(builder: (_) => const FilterPage())),
              icon: const Icon(Icons.filter_list))
        ],
      ),
      body: const CoursesPage(),
    );
  }
}
