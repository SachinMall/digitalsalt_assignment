import 'package:digitalsalt_assignment/view/course/course.dart';
import 'package:flutter/material.dart';
import 'package:digitalsalt_assignment/view_model/controller/courses_view_model.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultsPage extends StatefulWidget {
  final CourseViewModel controller;

  const SearchResultsPage({super.key, required this.controller});

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: TextField(
          onChanged: (value) {
            widget.controller.onSearch(value);
          },
          autofocus: true, 
          decoration: const InputDecoration(
            hintText: 'Search for courses',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      body: Obx(
        () => Skeletonizer(
          enabled: widget.controller.courseListLoading.value,
          child: widget.controller.filteredCourseList.isEmpty
              ? const Center(child: Text("No data"))
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    itemCount: widget.controller.filteredCourseList.length,
                    itemBuilder: (context, index) {
                      final course = widget.controller.filteredCourseList[index];
                      return CourseListItem(course: course);
                    },
                  ),
              ),
        ),
      ),
    );
  }
}
