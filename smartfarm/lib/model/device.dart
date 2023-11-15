class Device {
  String? id;
  String? name;
  String? landId;
  String? createdAt;
  String? updatedAt;

  Device({
    required this.id,
    required this.name,
    required this.landId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
    id: json["id"],
    name: json["name"],
    landId: json["land_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "land_id": landId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
