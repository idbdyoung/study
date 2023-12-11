import 'package:baemin_again/common/const/data.dart';
import 'package:baemin_again/common/dio/dio.dart';
import 'package:baemin_again/common/layout/default_layout.dart';
import 'package:baemin_again/restaurant/component/restaurant_card.dart';
import 'package:baemin_again/restaurant/component/restaurant_product_card.dart';
import 'package:baemin_again/restaurant/model/restaurant_detail_model.dart';
import 'package:baemin_again/restaurant/model/restaurant_model.dart';
import 'package:baemin_again/restaurant/model/restaurant_product_model.dart';
import 'package:baemin_again/restaurant/repository/restaurant_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String id;
  final String title;

  const RestaurantDetailScreen({
    required this.id,
    required this.title,
    super.key,
  });

  Future<RestaurantDetailModel> getRestaurantDetail() async {
    final dio = Dio();
    dio.interceptors.add(
      CustomInterceptor(
        storage: storage,
      ),
    );

    final repository =
        RestaurantRepository(dio, baseUrl: 'http://$ip/restaurant');

    return repository.getRestaurantDetail(id: id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: title,
      child: FutureBuilder<RestaurantDetailModel>(
        future: getRestaurantDetail(),
        builder: (_, AsyncSnapshot<RestaurantDetailModel> snapshot) {
          print(snapshot);
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final model = snapshot.data!;

          return CustomScrollView(
            slivers: [
              renderTop(
                model: model,
                detail: model.detail,
              ),
              renderLabel(),
              renderProducts(
                products: model.products,
              ),
            ],
          );
        },
      ),
    );
  }

  SliverToBoxAdapter renderTop({
    required RestaurantModel model,
    String? detail,
  }) {
    return SliverToBoxAdapter(
      child: RestaurantCard.fromModel(
        model: model,
        isDetail: true,
        detail: detail,
      ),
    );
  }

  SliverPadding renderLabel() {
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  SliverPadding renderProducts({
    required List<RestaurantProductModel> products,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 32.0,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: RestaurantProductCard.fromModel(
              model: products[index],
            ),
          );
        }, childCount: products.length),
      ),
    );
  }
}
