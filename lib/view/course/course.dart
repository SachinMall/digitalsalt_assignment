import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:digitalsalt_assignment/res/icons_asset/images.dart';
import 'package:digitalsalt_assignment/view/common_widgets/custom_textfield.dart';
import 'package:digitalsalt_assignment/view/search/search_result_page.dart';
import 'package:digitalsalt_assignment/view_model/controller/courses_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final CourseViewModel courseVM = Get.put(CourseViewModel());

  @override
  void initState() {
    super.initState();
    courseVM.getCourseListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kwhite,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Course",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColor.ktxtprimary),
                  ),
                  SvgPicture.asset(ImageAssets.profileAvatar),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                      },
                      child: CustomInputField(
                        onChanged: (value) {
                          // controller.onSearch(value);
                        },
                        onTap: () {
                                                Get.to(() => SearchResultsPage(controller: courseVM)); 
                          
                        },
                        textInputType: TextInputType.text,
                        title: '',
                        validator: (p0) {
                          return null;
                        },
                        fillColor: AppColor.klightGrey2,
                        hintText: 'Find Cousre',
                        isSuffixIcon: SvgPicture.asset(IconAssets.filterIcon,
                            fit: BoxFit.scaleDown),
                        prefixIcon: const Icon(Icons.search_rounded,
                            color: AppColor.klightGrey),
                        hintstyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.klightGrey),
                      ),
                    ),
                    const Gap(35),
                    Row(
                      children: [
                        Expanded(
                          child: _buildCourseCard(
                              title: 'Language',
                              imagePath: ImageAssets.course2,
                              color: Colors.lightBlue.shade50,
                              txtColor: AppColor.kprimaryColor,
                              containerColor: const Color(0xffF3FBFF)),
                        ),
                        const Gap(20),
                        Expanded(
                          child: _buildCourseCard(
                              title: 'Painting',
                              imagePath: ImageAssets.course1,
                              color: Colors.purple.shade50,
                              txtColor: AppColor.klightpurpleColor,
                              containerColor: const Color(0xffF8F2FF)),
                        ),
                      ],
                    ),
                    const Gap(20),
                    const Text(
                      'Choice your course',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColor.ktxtprimary),
                    ),
                    const Gap(14),
                    const SelectableCategoryRow(),
                    const Gap(20),
                     Obx(
                      () => Skeletonizer(
                        enabled: courseVM.courseListLoading.value,
                        child: courseVM.courseList.isEmpty
                            ? const Center(
                                child: Text("No data"),
                              )
                            : SizedBox(
                                height: Get.height,
                                child: ListView.builder(
                                itemCount: courseVM.filteredCourseList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final course = courseVM.filteredCourseList[index];
                                  return CourseListItem(course: course);
                                },
                              ),
                              ),
                      ),
                    ),
                    const Gap(30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(
      {required String title,
      required String imagePath,
      required Color color,
      required Color txtColor,
      required Color containerColor}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 80,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.all(6),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  color: containerColor),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500, color: txtColor),
              ),
            ),
          ),
        ),
        Positioned(
          top: -30,
          left: 10,
          child: SvgPicture.asset(
            imagePath,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class SelectableCategoryRow extends StatefulWidget {
  const SelectableCategoryRow({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectableCategoryRowState createState() => _SelectableCategoryRowState();
}

class _SelectableCategoryRowState extends State<SelectableCategoryRow> {
  int _selectedIndex = 0;
  final List<String> _categories = ['All', 'Popular', 'New'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(_categories.length, (index) {
        return _buildSelectableContainer(
          text: _categories[index],
          isSelected: _selectedIndex == index,
          onTap: () {
            setState((){
              _selectedIndex = index;
            });
          },
        );
      }),
    );
  }

  Widget _buildSelectableContainer({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.kprimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.white : AppColor.ktxtsecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}


class CourseListItem extends StatelessWidget {
  final dynamic course;

  const CourseListItem({super.key, this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.kwhite,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
        leading: Image.network(
          course?.imageUrl ?? 'https://placeholder.com/70x90',
          height: 100,
          width: 100,
          fit: BoxFit.contain,
        ),
        title: Text(
          course?.courseName ?? 'Course Name',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColor.ktxtprimary,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.person, color: AppColor.klightGrey, size: 16),
                const Gap(2),
                Text(
                  course?.instructor ?? 'Instructor Name',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.klightGrey,
                  ),
                ),
              ],
            ),
            const Gap(8),
            Row(
              children: [
                Text(
                  course?.price ?? '\$120',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.kprimaryColor,
                  ),
                ),
                const Gap(5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.klightorangeColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    course?.duration ?? '0 weeks',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColor.korangeColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}