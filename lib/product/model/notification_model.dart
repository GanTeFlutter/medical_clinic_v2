class NewNotificationModel {
  final String id;
  final String title;
  final String description;
  final String path;
  final bool checked;

  NewNotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.path,
    this.checked = false,
  });

  // Map'e dönüştürme
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'path': path,
      'checked': checked,
    };
  }

  // Map'ten oluşturma
  factory NewNotificationModel.fromMap(Map<String, dynamic> map) {
    return NewNotificationModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      path: map['path'],
      checked: map['checked'] ?? false,
    );
  }

  // JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'path': path,
      'checked': checked,
    };
  }

  // JSON'dan oluşturma
  factory NewNotificationModel.fromJson(Map<String, dynamic> json) {
    return NewNotificationModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      path: json['path'],
      checked: json['checked'] ?? false,
    );
  }
}
