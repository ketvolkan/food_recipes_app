import 'package:vexana/vexana.dart';

import '../../../core/utils/serializer.dart';

class FoodModel extends BaseModel implements INetworkModel<FoodModel> {
  int? id;
  String? imageUrl;
  String? name;
  int? time;

  FoodModel({this.id, this.imageUrl, this.name, this.time});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    name = json['name'];
    time = json['time'];
  }
  @override
  Map<String, dynamic>? toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['image_url'] = imageUrl;
    map['name'] = name;
    map['time'] = time;
    return map;
  }

  @override
  FoodModel fromJson(Map<String, dynamic> json) {
    return FoodModel.fromJson(json);
  }
}
