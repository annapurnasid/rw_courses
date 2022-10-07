import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../model/course.dart';
import 'repository.dart';

class CourseRepository implements Repository {
  // api end point to get course data
  String dataURL =
      'https://api.raywenderlich.com/api/contents?filter[content_types][]=collection';

  @override
  Future<List<Course>> getCourses(int domainFilter) async {
    final courses = <Course>[];
    var url = dataURL;

    if (domainFilter != Constants.allFilter) {
      url += ';&filter[domain_ids][]=$domainFilter';
    }

    // Converting URL to URI and making request
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final apiResponse = json.decode(response.body) as Map<String, dynamic>;

    final data = apiResponse['data'] as List;
    for (final json in data) {
      courses.add(Course.fromJson(json as Map<String, dynamic>));
    }
    return courses;
  }
}
