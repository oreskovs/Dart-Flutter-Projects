class Cast {
  Cast({required this.name, required this.role});

  final String name;
  final String role;

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(name: json['name'] as String, role: json['role'] as String);
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "role": role};
  }
}
