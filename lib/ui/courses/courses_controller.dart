import '../../repository/repository.dart';
import '../../model/course.dart';

class CourseController {

  final Repository _repository;

  // Injecting the repository to the controller
  CourseController(this._repository);

  // this future will return a list of courses
  Future<List<Course>> fetchCourses(int domainFilter) {
    return _repository.getCourses(domainFilter);
  }
}