import 'package:actual/common/const/data.dart';
import 'package:actual/common/dio/dio.dart';
import 'package:actual/common/model/cursor_pagination_model.dart';
import 'package:actual/restaurant/component/restaurant_card.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:actual/restaurant/provider/restaurant_provider.dart';
import 'package:actual/restaurant/repository/restaurant_repository.dart';
import 'package:actual/restaurant/view/restaurant_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(restaurantProvider);

    if (data is CursorPaginationLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final cursorPagination = data as CursorPagination;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        child:  ListView.separated(
      itemCount: cursorPagination.data.length,
        separatorBuilder: (_, index) {
          return SizedBox(
            height: 16.0,
          );
        },
        itemBuilder: (_, index) {
          final item = cursorPagination.data[index];

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RestaurantDetailScreen(id: item.id),
                ),
              );
            },
            child: RestaurantCard.fromModel(model: item),
          );
        },
      ),
      ),
    );
  }
}
