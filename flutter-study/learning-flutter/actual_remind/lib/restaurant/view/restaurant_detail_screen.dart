import 'package:actual_remind/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String id;

  const RestaurantDetailScreen({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
      child: Container(
        child: Text('sdf'),
      ),
    );
  }
}
