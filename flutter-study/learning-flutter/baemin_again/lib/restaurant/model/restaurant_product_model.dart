import 'package:baemin_again/common/utils/data_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part restaurant_

@JsonSerializable()
class RestaurantProductModel {
  final String id;
  final String name;
  @JsonKey(
    fromJson: DataUtils.pathToUrl,
  )
  final String imgUrl;
  final String detail;
  final int price;

  RestaurantProductModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.detail,
    required this.price,
  });

  factory RestaurantProductModel.fromJson(Map<String, dynamic> json)
  => _$RestaurantProductModelFromJson(json);
}
