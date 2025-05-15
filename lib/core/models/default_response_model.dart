class DefaultResponseModel {
  String? message;
  bool? status;

  DefaultResponseModel({this.message, this.status});

  DefaultResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
