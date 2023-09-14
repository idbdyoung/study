import 'package:actual_remind/common/const/colors.dart';
import 'package:actual_remind/common/const/data.dart';
import 'package:actual_remind/common/utils/data_utils.dart';
import 'package:actual_remind/restaurant/model/restaurant_model.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;
  final String name;
  final List<dynamic> tags;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;
  final double ratings;

  const RestaurantCard({
    required this.image,
    required this.name,
    required this.tags,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.ratings,
    super.key,
  });

  factory RestaurantCard.fromModel({required RestaurantModel model}) {
    return RestaurantCard(
      image: Image.network(
        DataUtils.pathToUrl(model.thumbUrl),
      ),
      name: model.name,
      tags: model.tags,
      ratingsCount: model.ratingsCount,
      deliveryTime: model.deliveryTime,
      deliveryFee: model.deliveryFee,
      ratings: model.ratings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: image,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              tags.join(' · '),
              style: TextStyle(
                color: BODY_TEXT_COLOR,
                fontSize: 14.0,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                _IconText(
                  iconData: Icons.star,
                  label: ratings.toString(),
                ),
                renderDot(),
                _IconText(
                  iconData: Icons.receipt,
                  label: ratingsCount.toString(),
                ),
                renderDot(),
                _IconText(
                  iconData: Icons.timelapse_outlined,
                  label: '$deliveryTime 분',
                ),
                renderDot(),
                _IconText(
                  iconData: Icons.monetization_on,
                  label: '${deliveryFee == 0 ? '무료' : deliveryFee.toString()}',
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  renderDot() {
    return const Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        ' · ',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData iconData;
  final String label;

  const _IconText({
    required this.iconData,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
