class Device {
  String? id;
  String? name;
  String? land_id;
  String? created_at;
  String? update_at;

  Device({
    required this.id,
    required this.name,
    required this.land_id,
    required this.created_at,
    required this.update_at,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device (
    id: json["id"],
    name: json["name"],
    land_id: json["land_id"],
    created_at: json["created_at"],
    update_at: json["update_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "land_id": land_id,
    "created_at": created_at,
    "update_at": update_at,
  };
}

