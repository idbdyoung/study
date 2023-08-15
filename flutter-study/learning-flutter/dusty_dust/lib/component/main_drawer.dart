import 'package:dusty_dust/const/colors.dart';
import 'package:dusty_dust/const/regions.dart';
import 'package:flutter/material.dart';

typedef OnRegionTap = void Function(String region);

class MainDrawer extends StatelessWidget {
  final String selectedRegion;
  final OnRegionTap onRegionTap;

  const MainDrawer({
    required this.selectedRegion,
    required this.onRegionTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: DARK_COLOR,
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              '지역 선택',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          ...regions
              .map(
                (e) => ListTile(
                  tileColor: Colors.white,
                  selectedTileColor: LIGHT_COLOR,
                  selectedColor: Colors.black,
                  selected: e == selectedRegion,
                  onTap: () {
                    onRegionTap(e);

                  },
                  title: Text(e),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
