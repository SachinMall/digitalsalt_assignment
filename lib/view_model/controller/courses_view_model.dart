import 'dart:developer';

import 'package:digitalsalt_assignment/model/course_list_model.dart';
import 'package:digitalsalt_assignment/repository/course_repository/course_repository.dart';
import 'package:get/get.dart';

class CourseViewModel extends GetxController {
  final _api = CourseRepository();

  RxBool courseListLoading = true.obs;
  RxList<CourseListModel> courseList = <CourseListModel>[].obs;

  Future<void> getCourseListData() async {
    courseListLoading.value = true;
    try {
     
      final response = await _api.courseListApi();
      if (response is List) {
   
        final courseModelObject = response
            .map<CourseListModel>((e) => CourseListModel.fromJson(e))
            .toList();
        courseList.assignAll(courseModelObject);
      } else {
        courseList.clear();
        log('Unexpected response format');
      }
    } catch (error, stackTrace) {
      courseList.clear();
      log('getCourseListData Error: $error \n$stackTrace');
    } finally {
      courseListLoading.value = false;
    }
  }
}
