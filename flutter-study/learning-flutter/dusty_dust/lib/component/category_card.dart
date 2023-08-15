import 'package:dusty_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';

import 'package:dusty_dust/component/card_title.dart';
import 'package:dusty_dust/component/main_card.dart';
import 'package:dusty_dust/component/main_stat.dart';
import 'package:dusty_dust/model/stat_and_status_model.dart';

class CategoryCard extends StatelessWidget {
  final String region;
  final List<StatAndStatusModel> models;
  final Color darkColor;
  final Color lightColor;

  const CategoryCard({
    required this.region,
    required this.models,
    required this.darkColor,
    required this.lightColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.0,
      child: MainCard(
        backgroundColor: lightColor,
        child: LayoutBuilder(builder: (context, constraint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardTitle(
                backgroundColor: darkColor,
                title: '종류별 통계',
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  children: models.map(
                    (model) => MainStat(
                      width: constraint.maxWidth / 3,
                      category: DataUtils.itemCodeKrString(itemCode: model.itemCode),
                      imgPath: model.statusModel.imagePath,
                      level: model.statusModel.label,
                      stat: '${model.statModel.getLevelFromRegion(region)}${DataUtils.getUnitFromItemCode(itemCode: model.itemCode)}',
                    ),
                  ).toList(),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
