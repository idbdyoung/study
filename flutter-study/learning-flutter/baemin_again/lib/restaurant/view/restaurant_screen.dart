import 'package:baemin_again/common/const/data.dart';
import 'package:baemin_again/common/dio/dio.dart';
import 'package:baemin_again/restaurant/component/restaurant_card.dart';
import 'package:baemin_again/restaurant/model/restaurant_model.dart';
import 'package:baemin_again/restaurant/repository/restaurant_repository.dart';
import 'package:baemin_again/restaurant/view/restaurant_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List<RestaurantModel>> paginateRestaurant() async {
    final dio = Dio();
    dio.interceptors.add(
      CustomInterceptor(storage: storage),
    );

    final res = await  RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant').pagination();

    return res.data;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FutureBuilder<List<RestaurantModel>>(
        future: paginateRestaurant(),
        builder: (context, AsyncSnapshot<List<RestaurantModel>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.separated(
            itemBuilder: (_, index) {
              final model = snapshot.data![index];

              return GestureDetector(
                child: RestaurantCard.fromModel(model: model),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => RestaurantDetailScreen(
                        id: model.id,
                        title: model.name,
                      ),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (_, index) => const SizedBox(
              height: 16.0,
            ),
            itemCount: snapshot.data!.length,
          );
        },
      ),
    );
  }
}
