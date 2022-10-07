import '../model/course.dart';

// Get the list of courses from the network call
abstract class Repository {

  // domainFilter specifies the courses that we want
  Future<List<Course>> getCourses(int domainFilter);
}