import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'package:baemin_again/restaurant/model/restaurant_detail_model.dart';

part 'restaurant_repository.g.dart';

@RestApi()
abstract class RestaurantRepository {
  factory RestaurantRepository(Dio dio, {String baseUrl}) =
      _RestaurantRepository;

  // @GET('/')
  // pagination() {
  //
  // }

  @GET('/{id}')
  Future<RestaurantDetailModel> getRestaurantDetail({
    @Path('id') required String id,
  });
}
