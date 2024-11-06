
import 'package:educational_app/core/models/courses.dart';
import 'package:educational_app/core/shared_widget/customization_appbar.dart';
import 'package:educational_app/features/course_details/presentation/views/view_model/course_cubit.dart';
import 'package:educational_app/features/course_details/presentation/views/widgets/course_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key ,  required this. courseModel });
  final CoursesModel? courseModel;

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {

  @override
  void initState() {
    super.initState();
    if (widget.courseModel != null) {
      BlocProvider.of<CoursesDetailsCubit>(context).fetchCourseDetails(widget.courseModel!.id.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        // appBar: const CustomAppBar(),
        appBar: CustomAppBar(courseId: widget.courseModel?.id.toString()),
        body: CourseBody(
          courseModel: widget.courseModel,
        ),
      ),
    );
  }
}
