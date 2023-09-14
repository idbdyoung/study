import 'package:actual_remind/common/model/cursor_pagination_model.dart';
import 'package:actual_remind/common/secure_storage/secure_storage.dart';
import 'package:actual_remind/restaurant/component/restaurant_card.dart';
import 'package:actual_remind/restaurant/model/restaurant_model.dart';
import 'package:actual_remind/restaurant/repository/restaurant_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:actual_remind/common/const/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestaurantScreen extends ConsumerWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<CursorPagination<RestaurantModel>>(
            future: ref.watch(restaurantRepositoryProvider).paginate(),
            builder: (context,
                AsyncSnapshot<CursorPagination<RestaurantModel>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              return ListView.separated(
                itemCount: snapshot.data!.data.length,
                separatorBuilder: (_, index) => const SizedBox(
                  height: 16.0,
                ),
                itemBuilder: (_, index) {
                  final model = snapshot.data!.data[index];

                  return RestaurantCard.fromModel(model: model);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
