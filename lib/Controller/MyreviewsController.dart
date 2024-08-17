import 'package:get/get.dart';

class MyReviewsController extends GetxController {
  var reviews = List.generate(10, (index) => {
    'name' : 'Wow Man',
    'rating': 4.5,
    'date': '1 July 2024',
    'user': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat dolor odio odio malesuada at condimentum adipiscing iaculis semper.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat dolor odio odio malesuada at condimentum adipiscing iaculis semper.condimentum adipiscing iaculis semper.',
    'avatar': 'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg' // Placeholder for user avatar
  }).obs;
}
