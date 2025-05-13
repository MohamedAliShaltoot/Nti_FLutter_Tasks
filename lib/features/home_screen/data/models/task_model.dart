import 'package:nti_flutter_tasks/features/add_task_screen/data/models/category_model.dart';


class TaskModel {
  String? title;
  String? description;
  DateTime? endDate;
  CategoryModel? categoryModel;

  TaskModel({this.title, this.description, this.endDate, this.categoryModel});
}
