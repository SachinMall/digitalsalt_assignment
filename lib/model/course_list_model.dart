// To parse this JSON data, do
//
//     final courseListModel = courseListModelFromJson(jsonString);

import 'dart:convert';

List<CourseListModel> courseListModelFromJson(String str) => List<CourseListModel>.from(json.decode(str).map((x) => CourseListModel.fromJson(x)));

String courseListModelToJson(List<CourseListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseListModel {
    String courseName;
    String instructor;
    String price;
    String duration;
    String imageUrl;

    CourseListModel({
         this.courseName = "",
         this.instructor = "",
         this.price = "",
         this.duration = "",
         this.imageUrl = "",
    });

    factory CourseListModel.fromJson(Map<String, dynamic> json) => CourseListModel(
        courseName: json["course_name"] ?? "",
        instructor: json["instructor"] ?? "",
        price: json["price"] ?? "",
        duration: json["duration"] ?? "",
        imageUrl: json["image_url"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "course_name": courseName,
        "instructor": instructor,
        "price": price,
        "duration": duration,
        "image_url": imageUrl,
    };
}
