import 'package:flutter/material.dart';
import 'package:sh_courses/utils/string_extensions.dart';

import '../../model/course.dart';
import 'image_container.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: Column(
        children: [
          _buildImageBanner(),
          _buildPrimaryDetails(context),
          _buildSecondaryDetails(context)
        ],
      ),
    );
  }

  Widget _buildImageBanner() {
    return Hero(

      // this tag value matches with the course thumbnail in list page
      // this will enable hero animation between the images
        tag: "cardArtWork-${course.courseId}",
        child: ImageContainer(height: 200, url: course.artworkUrl));
  }

  Widget _buildPrimaryDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              course.name,
              style:
                  Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 24),
            ),
          ),
          Text(
            course.description,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  Widget _buildSecondaryDetails(BuildContext context) {
    const style = TextStyle(fontSize: 16.0);

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Domain(s): ${course.domainString}',
            style: style,
          ),
          Text(
            'Level: ${course.difficulty.capitalize()}',
            style: style,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              course.contributors,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
