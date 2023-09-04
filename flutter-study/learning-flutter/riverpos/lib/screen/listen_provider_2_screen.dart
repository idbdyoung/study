import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpos/layout/default_layout.dart';
import 'package:riverpos/riverpod/listen_provider_2.dart';

class ListenProviderScreen2 extends ConsumerStatefulWidget {
  const ListenProviderScreen2({super.key});

  @override
  ConsumerState<ListenProviderScreen2> createState() =>
      _ListenProviderScreen2State();
}

class _ListenProviderScreen2State extends ConsumerState<ListenProviderScreen2>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider2),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      listenProvider2,
      (previous, next) {
        if (previous != next) {
          controller.animateTo(next);
        }
      },
    );

    return DefaultLayout(
      title: 'listenProvider2',
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(index.toString()),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(listenProvider2.notifier)
                        .update((state) => state == 10 ? 10 : state + 1);
                  },
                  child: Text('이전')),
              ElevatedButton(onPressed: () {}, child: Text('다음')),
            ],
          ),
        ),
      ),
    );
  }
}
