import 'package:baemin_again/common/const/color.dart';
import 'package:baemin_again/restaurant/model/restaurant_product_model.dart';
import 'package:flutter/material.dart';

class RestaurantProductCard extends StatelessWidget {
  final Image image;
  final String name;
  final String detail;
  final int price;

  const RestaurantProductCard({
    required this.image,
    required this.name,
    required this.detail,
    required this.price,
    super.key,
  });

  factory RestaurantProductCard.fromModel({
    required RestaurantProductModel model,
  }) {
    return RestaurantProductCard(
      image: Image.network(
        model.imgUrl,
        width: 110,
        height: 110,
        fit: BoxFit.cover,
      ),
      name: model.name,
      detail: model.detail,
      price: model.price,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            child: image,
            borderRadius: BorderRadius.circular(8.0),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  detail,
                  style: const TextStyle(
                    color: BODY_TEXT_COLOR,
                    fontSize: 14.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$ $price',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: PRIMARY_COLOR,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
