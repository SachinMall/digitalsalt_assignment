import 'package:digitalsalt_assignment/view_model/auth_view_model.dart';
import 'package:digitalsalt_assignment/view_model/controller/courses_view_model.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthViewModel(), permanent: true);
    Get.put(CourseViewModel(), permanent: true);
   
  }
}