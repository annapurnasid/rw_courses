# RW Courses

A new Flutter project based on the [Ray Wenderlich API](https://api.raywenderlich.com/api/contents?filter[content_types][]=collection).

## App Description:

Network call is made to api and data is fetched.
Based on the API annotations, data is sorted and displayed in a list view. The list contains a list of courses.

On clicking a course, you move to the course details page. In this page, there is the banner image, associated woth the course, name, description and other details.
You also have a filter feature, using which you can filter the courses based on the domain.

## Features Included:
- Using Model and repository to structure the code
- HTTP call to Rest API
- Parsing network data
- Displaying CircularProgressIndicator while waiting for network data
- Using List View
- Hero Animation for the image
- Navigation between screens
- Creating a FilterWidget using radio widgets
- Storing filter choice in SharedPreference
- Maintaining the state of flutter widget using Inherited Widget
- Displaying results based on filters



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
