class Land {
  String? id;
  String? name;
  String? image;
  String? description;
  String? polygon;
  String? area;
  String? cropStatus;
  String? cropPlantedAt;
  String? userId;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Land({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.polygon,
    required this.area,
    required this.cropStatus,
    required this.cropPlantedAt,
    required this.userId,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Land.fromJson(Map<String, dynamic> json) => Land(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    polygon: json["polygon"],
    area: json["area"],
    cropStatus: json["crop_status"],
    cropPlantedAt: json["crop_planted_at"],
    userId: json["user_id"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "description": description,
    "polygon": polygon,
    "area": area,
    "crop_status": cropStatus,
    "crop_planted_at": cropPlantedAt,
    "user_id": userId,
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
