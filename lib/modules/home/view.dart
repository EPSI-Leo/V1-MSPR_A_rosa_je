import 'package:arosa_je/modules/map/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Column(
            children: [
              MapView(),
            ],
          ),
          Positioned(
            top: 30.0,
            left: 16.0,
            child: Builder(
              builder: (BuildContext builderContext) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(builderContext).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 8.0,
            right: 8.0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.green,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    color: Colors.white,
                    onPressed: () async {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
