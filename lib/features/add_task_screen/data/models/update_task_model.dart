import 'package:image_picker/image_picker.dart';

class UpdateTaskModel {
  String? message;
  bool? status;
  UpdateTask? task;

  UpdateTaskModel({this.message, this.status, this.task});

  UpdateTaskModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    task = json['task'] != null ?  UpdateTask.fromJson(json['task']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  {};
    data['message'] = message;
    data['status'] = status;
    if (task != null) {
      data['task'] = task!.toJson();
    }
    return data;
  }
}

class UpdateTask {
  String? description;
  int? id;
  XFile? imagePath;
  String? title;

  UpdateTask({this.description, this.id, this.imagePath, this.title});

  UpdateTask.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    imagePath = json['image_path'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = description;
    data['id'] = id;
    data['image_path'] = imagePath;
    data['title'] = title;
    return data;
  }
}
