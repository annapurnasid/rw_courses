import 'package:flutter/material.dart';
import 'package:sh_courses/repository/course_repository.dart';
import 'package:sh_courses/ui/course_detail/course_details_page.dart';

import '../../model/course.dart';
import '../../state/filter_state_container.dart';
import 'courses_controller.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CourseController(CourseRepository());
  late FilterState state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // whenever inherited widget updates, (updateShouldNotify returns true),
    // the state property of FilterPageState will update, and page will be rebuilt.
    state = FilterStateContainer.of(context);
  }

  @override
  Widget build(BuildContext context) {
    // Future builder to get the course list after the network call
    return FutureBuilder<List<Course>>(
      future: _controller.fetchCourses(state.filterValue),
      builder: (context, snapshot) {
        final courses = snapshot.data;

        // When the data is not already received from network OR when filter is refreshed
        // Show circular progress indicator
        if (courses == null ||
            snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: courses.length,
            itemBuilder: (BuildContext context, int position) {
              return _buildListTile(courses[position]);
            });
      },
    );
  }

  // Building individual list tile
  Widget _buildListTile(Course course) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(course.name, style: const TextStyle(fontSize: 18.0)),
        ),
        subtitle: Text(course.domainString),
        trailing: Hero(
          // this tag value matches with the course thumbnail in details page
          // this will enable hero animation between the images
          tag: "cardArtWork-${course.courseId}",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(course.artworkUrl),
          ),
        ),
        onTap: () {
          Navigator.of(context).push<MaterialPageRoute>(MaterialPageRoute(
              builder: (context) => CourseDetailsPage(course: course)));
        },
      ),
    );
  }
}
