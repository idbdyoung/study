import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/model/status_model.dart';

class StatAndStatusModel {
  final ItemCode itemCode;
  final StatusModel statusModel;
  final StatModel statModel;

  StatAndStatusModel({
    required this.itemCode,
    required this.statModel,
    required this.statusModel,
  });
}
