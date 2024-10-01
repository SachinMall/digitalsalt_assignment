import 'dart:developer';

import 'package:digitalsalt_assignment/model/course_list_model.dart';
import 'package:digitalsalt_assignment/repository/course_repository/course_repository.dart';
import 'package:get/get.dart';

class CourseViewModel extends GetxController {
  final _api = CourseRepository();

  RxBool courseListLoading = true.obs;
  RxList<CourseListModel> courseList = <CourseListModel>[].obs;

  RxList<CourseListModel> filteredCourseList = <CourseListModel>[].obs;
  RxString searchQuery = ''.obs;


  @override
  void onInit() {
    super.onInit();
    debounce(searchQuery, (_) => filterCourses(), time: const Duration(milliseconds: 300));
  }


  void filterCourses() {
    if (searchQuery.value.isEmpty) {
      filteredCourseList.assignAll(courseList);
    } else {
      filteredCourseList.assignAll(
        courseList.where((course) => course.courseName.toLowerCase().contains(searchQuery.value.toLowerCase())).toList(),
      );
    }
  }

  void onSearch(String query) {
    searchQuery.value = query;
  }


  Future<void> getCourseListData() async {
    courseListLoading.value = true;
    try {
     
      final response = await _api.courseListApi();
      if (response is List) {
   
        final courseModelObject = response
            .map<CourseListModel>((e) => CourseListModel.fromJson(e))
            .toList();
        courseList.assignAll(courseModelObject);
                filterCourses(); 
      } else {
        courseList.clear();
                filteredCourseList.clear();
        log('Unexpected response format');
      }
    } catch (error, stackTrace) {
      courseList.clear();
            filteredCourseList.clear();
      log('getCourseListData Error: $error \n$stackTrace');
    } finally {
      courseListLoading.value = false;
    }
  }
}
