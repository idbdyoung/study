import 'package:actual_remind/restaurant/component/restaurant_card.dart';
import 'package:actual_remind/restaurant/model/restaurant_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:actual_remind/common/const/data.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  Future<List> paginateRestaurant() async {
    final dio = Dio();
    final token = await storage.read(key: ACCESS_TOKEN_KEY);

    final res = await dio.get(
      'http://${IP}/restaurant',
      options: Options(
        headers: {
          'authorization': 'Bearer $token',
        },
      ),
    );

    return res.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<List>(
            future: paginateRestaurant(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (_, index) => SizedBox(height: 16.0),
                itemBuilder: (_, index) {
                  final item = snapshot.data![index];

                  return RestaurantCard(
                    image: item['thumbUrl'],
                    name: item['name'],
                    tags: item['tags'],
                    ratingsCount: item['ratingsCount'],
                    deliveryTime: item['deliveryTime'],
                    deliveryFee: item['deliveryFee'],
                    ratings: item['ratings'],
                  );
                }
              );
            },
          ),
        ),
      ),
    );
  }
}
