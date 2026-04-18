class GetAllTodoModel {
  int? count;
  String? next;
  String? previous;
  List<Results>? results;

  GetAllTodoModel({this.count, this.next, this.previous, this.results});

  GetAllTodoModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? title;
  String? description;
  bool? isCompleted;
  String? priority;
  String? dueDate;
  String? createdAt;
  String? updatedAt;

  Results({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.priority,
    this.dueDate,
    this.createdAt,
    this.updatedAt,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isCompleted = json['is_completed'];
    priority = json['priority'];
    dueDate = json['due_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['is_completed'] = this.isCompleted;
    data['priority'] = this.priority;
    data['due_date'] = this.dueDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
