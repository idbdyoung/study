import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/layout/default_layout.dart';
import 'package:untitled/riverpod/listen_provider.dart';

class ListenProviderScrenn extends ConsumerStatefulWidget {
  const ListenProviderScrenn({super.key});

  @override
  ConsumerState<ListenProviderScrenn> createState() =>
      _ListenProviderScrennState();
}

class _ListenProviderScrennState extends ConsumerState<ListenProviderScrenn>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(listenProvider, (previous, next) {
      if (previous != next) {
        tabController.animateTo(next);
      }
    });

    return DefaultLayout(
      title: 'ListenProviderScrenn',
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                index.toString(),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 10 ? 10 : state + 1);
                },
                child: Text('다음'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 0 ? 0 : state - 1);
                },
                child: Text('뒤로'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
